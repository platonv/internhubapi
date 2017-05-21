module Students
  class StudentsController < ApplicationController

    devise_token_auth_group :member, contains: [:student]
    before_action :authenticate_member!

  end
end
