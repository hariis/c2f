class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params[:vendor])
    if @vendor.save
      redirect_to "/login", :notice => "Thank you! Sign up Successful! Please login to proceed"
    else
      render "new"
    end
  end
end

