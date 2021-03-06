class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :confirm_logged_in
  include SessionsHelper

  def confirm_logged_in
     unless session[:user_id]
         flash[:danger] = "Please log in"
         redirect_to :root
         return false
     else
         return true
     end
  end
end
