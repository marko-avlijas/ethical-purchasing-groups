require "rails_helper"

RSpec.describe Admin::GroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/en/admin/groups").to route_to("admin/groups#index", locale: "en")
    end

    it "routes to #new" do
      expect(get: "/en/admin/groups/new").to route_to("admin/groups#new", locale: "en")
    end

    it "routes to #show" do
      expect(get: "/en/admin/groups/1").to route_to("admin/groups#show", id: "1", locale: "en")
    end

    it "routes to #edit" do
      expect(get: "/en/admin/groups/1/edit").to route_to("admin/groups#edit", id: "1", locale: "en")
    end


    it "routes to #create" do
      expect(post: "/en/admin/groups").to route_to("admin/groups#create", locale: "en")
    end

    it "routes to #update via PUT" do
      expect(put: "/en/admin/groups/1").to route_to("admin/groups#update", id: "1", locale: "en")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/en/admin/groups/1").to route_to("admin/groups#update", id: "1", locale: "en")
    end

    it "routes to #destroy" do
      expect(delete: "/en/admin/groups/1").to route_to("admin/groups#destroy", id: "1", locale: "en")
    end
  end
end
