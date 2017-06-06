module Jobs
  class JobsController < ApplicationController
    devise_token_auth_group :member, contains: [:admin, :company, :student]
    before_action :authenticate_member!

    api! 'List all jobs'
    def index
      if current_company
        @jobs = current_member.jobs
      elsif current_student
        @jobs = Job.all
      end
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

    api! 'Get job'
    def show
      if current_company
        @job = current_member.jobs.find(params[:id])
      elsif current_student
        @job = Job.find(params[:id])
      end
      render json: @job
    end

    api! 'Get applications for job'
    def applications
      @applications = current_member.jobs.find(params[:id]).applications
      result = applications.map { |application| { "id":application.id, "student": application.student, "job": application.job } }
      render json: result
    end

    private

    def job_params
      params.require(:job).permit(:id, :name, :description, :company_id)
    end
  end
end
