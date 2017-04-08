class JobsController < ApplicationController
  #devise_token_auth_group :admin, contains: [:admin]
  #before_action :authenticate_admin!

  def index
    @jobs = Job.all
    render json: @jobs
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render "Success"
    else
      render "Fail"
    end
  end

  private

  def job_params
    params.require(:job).permit(:name, :description)
  end
end
