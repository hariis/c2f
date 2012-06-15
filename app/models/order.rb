require_relative 'order_helper'
class Order < ActiveRecord::Base
  extend OrderHelper
  has_many :products
  def self.gather
        @api = Order.get_api_handle

        #get all orders
        @api.get_orders.each do |jo|
            next if Order.order_already_exists?(jo["id"].to_i)
            o = Order.create_new_order(jo)

            #gather products for each order
            @api.get_order_products(jo["id"].to_s).each do |product|
              Order.create_new_product(product, o)
            end
       end #get_orders

    end #def
    def self.get_products_by_vendor(vendor_id)
      products_by_vendor = {}
      pending_orders = Order.find_all_by_status("Awaiting Fulfillment")
      pending_orders.each do |order|
          pending_products = order.products.find_all{|p| p if p.brand_id == vendor_id}
          next if pending_products.count == 0
          #save this product
          pending_products.each do |p|
              products_by_vendor[p.name] = 0 if products_by_vendor[p.name].nil?
              products_by_vendor[p.name] = products_by_vendor[p.name] + p.quantity
          end
      end
      return products_by_vendor
    end

end

