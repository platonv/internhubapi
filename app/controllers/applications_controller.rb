class ApplicationsController < ApplicationController
  devise_token_auth_group :member, contains: [:admin, :company, :student]
  before_action :authenticate_member!

  api! 'Create new application'
  param :job_id, Int, 'Job id', :required => true
  def create
    job = Job.find(application_params[:job_id])
    @application = current_member.applications.create(job: job)
    if @application.save
      render json: @application
    else
      render "Error"
    end
  end

  api! 'Delete application'
  param :id, Int, 'Application id', :required => true
  def delete
    @application = Application.find(application_params[:id])
    if @application.delete
      render "Deleted"
    else
      render "Error"
    end
  end


  private

  def create_params
    params.require(:application).permit(:id, :job_id)
  end
end
