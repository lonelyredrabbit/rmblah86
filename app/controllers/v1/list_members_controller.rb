module V1
class ListMembersController < ApplicationController
  before_action :set_list_member, only: [:show, :update, :destroy]

  # GET /list_members
  def index
    if params[:group_id]
    @list_members =  ListMember.where(:list_id => params[:list_id])
    else  
    @list_members = ListMember.all
    end
  end

  # GET /list_members/1
  def show
    render json: @list_member
  end

  # POST /list_members
  def create
    @list_member = ListMember.new(list_member_params)

    if @list_member.save
      render json: @list_member, status: :created, location: @list_member
    else
      render json: @list_member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /list_members/1
  def update
    if @list_member.update(list_member_params)
      render json: @list_member
    else
      render json: @list_member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /list_members/1
  def destroy
    @list_member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_member
      @list_member = ListMember.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_member_params
      params.require(:list_member).permit(:list_id, :member_jid)
    end
end
end
