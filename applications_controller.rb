class ApplicationsController < ApplicationController
    load_and_authorize_resource
    before_action :set_application, :except => [:index, :new, :create]
    # GET /applications
       def index
         @applications= Application.all
         json_response(@applications)
      end
      #create new job_application 
      def new
        @application = Application.new
        
     end
      # POST /applications
      def create
    
       @application = Application.find_by_user_id_and_jobs_id(params[:application][:user_id], params[:application][:jobs_id])

      if !@application.nil?
        redirect_to root_path, alert: "You already applied for this job."
      else
           @application = Application.new(application_params)
           if @application.save
           redirect_to root_path, alert: "Your application has been sent. Good Luck!"
          else
           alert: "Oops, there was a problem, please try again"
           end
      end
     end
   
     # list jobs
     def show
      @jobs = Job.all_sort_by_date.limit(8)
      json_response(@jobs)
     end
   
     def destroy
      @application.destroy
      redirect_to root_path
    end

    # update status by admin
    def update
      authorize! :update, Price
      @application = Application.find(params[:id])
     
      if @application.update_attributes(params[:seen])
        redirect_to root_path, alert: "Application is reviewed by admin"
      else
        alert: "Oops, there was a problem, please try again"
      end
      
   end
     private
   
     def application_params
       params.permit(:full_name, :head_title, :seen, :user_id, :jobs_id)
     end
   
     def set_application
       @application = Application.find(params[:id])
     end
end
