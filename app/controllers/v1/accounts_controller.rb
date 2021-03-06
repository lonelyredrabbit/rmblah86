module V1
class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:create]

  # GET /accounts
  def index
    @accounts = Account.all

    render json: @accounts
  end


  def getaccountsbyjid
    @accounts =  Account.where(:jid => params[:jid])
    render json: @accounts
  end
  
  def getaccountsbyemail
    @accounts =  Account.where(:email => params[:email])
    render json: @accounts
  end
  
  def getaccountsbyphonenumber
    @accounts =  Account.where(:phone_number => params[:phone_number])
    render json: @accounts
  end

  # GET /accounts/1
  def show
    render json: @account
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    @account.jid = @account.country_code + @account.phone_number + "@neucom.io"
    @user =  User.new()
    @user.jid = @account.jid

    if @account.save     
      if @user.save
         render json: @account, status: :created, location: @account
      end  
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through., :password_confirmation
    def account_params
      params.require(:account).permit(:email, :password, :password_confirmation,:phone_number, :country_code, :name)
    end
end
end
