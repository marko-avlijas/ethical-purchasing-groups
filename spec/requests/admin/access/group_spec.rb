require 'rails_helper'

RSpec.describe "Access to /admin/groups/", type: :request do
  describe "GET /admin/locations" do
    context "annonymous user" do
      it "gets redirected to sign up page with you need to sign in message" do
        get "/en/admin/groups"

        expect(response).to redirect_to('/en/users/sign_in.html')
        follow_redirect!

        expect(response).to have_http_status(200)
        expect(response.body).to match /need to sign in/
      end
    end

    context "non-admin user" do
      let(:user) { create(:user) }

      it "gets redirected with admin required message" do
        sign_in user
        get "/en/admin/groups"

        expect(response).to redirect_to(root_url)
        follow_redirect!

        expect(response).to have_http_status(200)
        expect(response.body).to match /Access allowed only for superadmins/
      end
    end

    context "admin user" do
      let(:user) { create(:user, :superadmin) }

      it "can access page" do
        sign_in user
        get "/en/admin/groups"

        expect(response).to have_http_status(200)
        # ensure we see group created in fixtures
        expect(response.body).to match /Best Group/
      end
    end
  end
end
