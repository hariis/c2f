class OrdersController < ApplicationController
  before_filter :require_login, :except => 'sync'
  before_filter :ensure_admin_login, :only => 'sync'
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.find_all_by_status("Awaiting Fulfillment")
    @products_by_vendor = Order.get_products_by_vendor(current_vendor.brand_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def sync
    @products = Order.gather
    respond_to do |format|
      format.html {redirect_to orders_url, notice: 'Sync successful.'}
    end
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders = Order.find_all_by_status("Awaiting Fulfillment")
    @selection_id = params[:selection_id]
    if @selection_id != "-1"
        @products_by_vendor = Order.get_products_by_vendor(@selection_id)
    end
    respond_to do |format|
      format.html {render :layout => false}
      format.json { render json: @order }
      format.js
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end

