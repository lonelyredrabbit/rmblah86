require "rails_helper"

RSpec.describe V1::BroadcastListsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/broadcast_lists").to route_to("broadcast_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/broadcast_lists/new").to route_to("broadcast_lists#new")
    end

    it "routes to #show" do
      expect(:get => "/broadcast_lists/1").to route_to("broadcast_lists#show", :list_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/broadcast_lists/1/edit").to route_to("broadcast_lists#edit", :list_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/broadcast_lists").to route_to("broadcast_lists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/broadcast_lists/1").to route_to("broadcast_lists#update", :list_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/broadcast_lists/1").to route_to("broadcast_lists#update", :list_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/broadcast_lists/1").to route_to("broadcast_lists#destroy", :list_id => "1")
    end

  end
end
