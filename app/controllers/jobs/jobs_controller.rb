module Jobs
  class JobsController < ApplicationController
    devise_token_auth_group :member, contains: [:admin, :company, :student]
    before_action :authenticate_member!

    api! 'List all jobs'
    def index
      @jobs = Job.all
      render json: @jobs
    end

    api! 'Create new job'
    def create
      @job = current_member.jobs.create(job_params)
      if @job.save
        render json: @job
      else
        render "Error"
      end
    end

    api! 'Get applications for job'
    def applications
      @applications = current_member.jobs.find(job_params[:id]).applications
      render json: @applications
    end

    private

    def job_params
      params.require(:job).permit(:id, :name, :description, :company_id)
    end
  end
end
