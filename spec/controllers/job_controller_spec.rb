require 'rails_helper'

describe JobsController do

  describe "GET jobs" do

    it "fails for anonymous" do
      get :index
      expect(response).to be_unauthorized
    end

    it "successes for admin" do
      admin = Admin.create(email: 'test@test.com', password: '123456')
      auth_headers = admin.create_new_auth_token
      admin.save
      get :index, auth_headers
      expect(response).to be_success
    end

  end

  describe "POST create" do
    let (:job) { FactoryGirl.build(:job)}

    it "renders success" do
      post :create, job: FactoryGirl.attributes_for(:job)
    end

  end
end