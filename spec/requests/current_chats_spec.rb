require 'rails_helper'

RSpec.describe "CurrentChats", type: :request do
  describe "GET /current_chats" do
    it "works! (now write some real specs)" do
      get current_chats_path
      expect(response).to have_http_status(200)
    end
  end
end
