class ApplicationsController < ApplicationController
  devise_token_auth_group :member, contains: [:admin, :company, :student]
  before_action :authenticate_member!

  api! 'Create new application'
  param :job_id, 'Job id', :required => true
  def create
    job = Job.find(application_params[:job_id])
    @application = current_member.applications.create(job: job)
    if @application.save
      render json: @application
    else
      render "Error"
    end
  end

  private

  def application_params
    params.require(:application).permit(:job_id)
  end
end
