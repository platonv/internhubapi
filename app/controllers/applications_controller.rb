class ApplicationsController < ApplicationController
  devise_token_auth_group :member, contains: [:admin, :company, :student]
  before_action :authenticate_member!

  api! 'Create new application'
  param :job_id, String, 'Job id', :required => true
  def create
  end

  private

  def application_params
    params.require(:application).permit(:job_id)
  end
end
