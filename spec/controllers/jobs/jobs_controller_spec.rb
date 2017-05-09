require 'rails_helper'

describe Jobs::JobsController do

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

  it "successes for company" do
      company = Company.create(email: 'test@test.com', password: '123456')
      auth_headers = company.create_new_auth_token
      company.save
      get :index, auth_headers
      expect(response).to be_succes
    end


  end

  describe "POST create as admin" do
    let (:job) { FactoryGirl.build(:job)}

    before do
      company = Company.create(email: 'test@test.com', password: '123456')
      auth_headers = company.create_new_auth_token
      company.save
      request.headers.merge!(auth_headers)
      post :create, job: FactoryGirl.attributes_for(:job)
      expect(response).to be_success
    end

    it "returns HTTP success" do
      expect(response).to be_success
    end

    it "returns posted entity" do
      job = FactoryGirl.build(:job)
      parsed = JSON.parse(response.body)
      expect(parsed['name']).to eq(job.name)
      expect(parsed['description']).to eq(job.description)
    end

  end
end
