class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def default_serializer_options
    { root: false }
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def admin_user
    flash[:danger] = "You do not have permission to perform this action."
    redirect_to(root_url) unless current_user.admin?
  end
end
