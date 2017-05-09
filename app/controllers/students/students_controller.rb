module Students
  class StudentsController < ApplicationController

    devise_token_auth_group :member, contains: [:student]
    before_action :authenticate_member!

    !api 'Get applications for current student'
    def applications
      @applications = current_member.applications
      render json: @applications
    end

  end
end
