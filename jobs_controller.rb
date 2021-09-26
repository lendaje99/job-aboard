class JobsController < ApplicationController
load_and_authorize_resource
 before_action :set_job, only: [:show, :update, :destroy]
 # GET /jobs
    def index
      @jobs = Job.all
      json_response(@jobs)
   end

   # POST /jobs
   def create
    authorize! :create, Job
    @job = Job.create!(job_params)
    json_response(@job, :created)
  end

  # Get /jobs/:id
  def show
    json_response(@job)
  end

    # PUT /jobs/:id
  def update
        authorize! :update, Job
        @job.update(job_params)
        head :no_content
  end
    
      # DELETE /jobs/:id
  def destroy
        authorize! :destroy, Job
        @job.destroy
        head :no_content
  end

  private

  def job_params
    params.permit(:title, :desc)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
