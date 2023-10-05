require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  describe "GET /index" do
    context "when user is logged in" do
      it "returns http success" do
        user = FactoryBot.create(:user)
        sign_in(user)
        get "/dashboard"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
