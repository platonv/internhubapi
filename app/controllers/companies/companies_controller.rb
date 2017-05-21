module API
  module Companies
    class CompaniesController < ApplicationController
      devise_token_auth_group :member, contains: [:company]
      before_action :authenticate_member!
    end
  end
end
