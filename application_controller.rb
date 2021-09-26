class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end
  
  private
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
