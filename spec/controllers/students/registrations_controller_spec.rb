require 'rails_helper'

describe Students::RegistrationsController do
  describe "POST student" do
    it "creates student" do
      @request.env["devise.mapping"] = Devise.mappings[:student]
      post :create, student: FactoryGirl.attributes_for(:student)
    end
  end
end