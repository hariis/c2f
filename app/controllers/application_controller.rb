class ApplicationController < ActionController::Base
  protect_from_forgery
private

  def current_vendor
    @current_vendor ||= Vendor.find(session[:vendor_id]) if session[:vendor_id]
  end

  helper_method :current_vendor

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/login' # halts request cycle
    end
  end

  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def logged_in?
    !!current_vendor
  end
end

