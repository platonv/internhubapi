class JobsController < ApplicationController
  devise_token_auth_group :member, contains: [:admin, :company]
  before_action :authenticate_member!

  api! 'List all jobs'
  def index
    @jobs = Job.all
    render json: @jobs
  end

  api! 'Create new job'
  param :name, String, 'Job name', :required => true
  param :description, String, 'Job description', :required => true
  param :company_id, String, 'Id of parent company(not required for now)', :required => false
  def create
    @job = current_member.jobs.create(job_params)
    if @job.save
      render json: @job
    else
      render "Error"
    end
  end

  private

  def job_params
    params.require(:job).permit(:name, :description, :company_id)
  end
end
