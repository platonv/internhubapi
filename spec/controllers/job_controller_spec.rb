require 'rails_helper'

describe JobsController do
  describe "POST create" do
    let (:job) { FactoryGirl.build(:job)}

    it "renders success" do
      post :create, job: FactoryGirl.attributes_for(:job)
    end
  end
end