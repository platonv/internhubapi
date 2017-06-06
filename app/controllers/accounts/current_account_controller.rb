module Accounts
  class CurrentAccountController < ApplicationController
    devise_token_auth_group :member, contains: [:student, :company, :university, :admin]
    before_action :authenticate_member!

    api! 'Get current account data'
    def get_current_account
      render json: current_member
    end
  end
end
