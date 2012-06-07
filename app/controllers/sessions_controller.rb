class SessionsController < ApplicationController
  def new
  end

  def create
    vendor = Vendor.find_by_email(params[:email])
    if vendor && vendor.authenticate(params[:password])
      session[:vendor_id] = vendor.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:vendor_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

