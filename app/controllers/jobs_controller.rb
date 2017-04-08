class JobsController < ApplicationController
  
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
