require 'rails_helper'

describe Accounts::CurrentAccountController do

  describe "GET current account" do

    it "fails for anonymous" do
      get :get_current_account
      expect(response).to be_unauthorized
    end

    it "successes for student" do
      student = Student.create(email: 'test@test.com', password: '123456')
      auth_headers = student.create_new_auth_token
      student.save
      get :get_current_account, auth_headers
      expect(response).to be_success
    end

  it "successes for company" do
      company = Company.create(email: 'test@test.com', password: '123456')
      auth_headers = company.create_new_auth_token
      company.save
      get :get_current_account, auth_headers
      expect(response).to be_success
    end

  end
end
