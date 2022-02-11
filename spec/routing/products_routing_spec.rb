require "rails_helper"

RSpec.describe ProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/en/products").to route_to("products#index", locale: "en")
    end

    it "routes to #new" do
      expect(get: "/en/products/new").to route_to("products#new", locale: "en")
    end

    it "routes to #show" do
      expect(get: "/en/products/1").to route_to("products#show", id: "1", locale: "en")
    end

    it "routes to #edit" do
      expect(get: "/en/products/1/edit").to route_to("products#edit", id: "1", locale: "en")
    end


    it "routes to #create" do
      expect(post: "/en/products").to route_to("products#create", locale: "en")
    end

    it "routes to #update via PUT" do
      expect(put: "/en/products/1").to route_to("products#update", id: "1", locale: "en")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/en/products/1").to route_to("products#update", id: "1", locale: "en")
    end

    it "routes to #destroy" do
      expect(delete: "/en/products/1").to route_to("products#destroy", id: "1", locale: "en")
    end
  end
end
