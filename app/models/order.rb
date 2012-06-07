require 'bigcommerce'
class Order < ActiveRecord::Base
  has_many :products
  def self.gather
    @api = BigCommerce::Api.new({
        :store_url => "https://store-6dfb2.mybigcommerce.com",
        :username  => "apiuser",
        :api_key   => "7dd8478259753daec9323f0f0f012b59"
    })
        #get all orders
        @api.get_orders.each do |jo|
            o = Order.new(:parent_order_id => jo["id"], :date_created => jo["date_modified"], :status => jo["status"], :customer_message => jo["customer_message"],
            :is_deleted => jo["is_deleted"])
            o.save


            #gather products for each order
            @api.get_order_products(jo["id"].to_s).each do |product|
              p = Product.new(:name => product["name"], :base_price => product["base_price"].to_f, :quantity => product["quantity"], :order_id => o.id,
              :product_id => product["product_id"].to_i)
              #get the product details to get the brand
              actual_product = @api.get_product(product["product_id"].to_s)
              p.brand_id = actual_product["brand_id"]
              p.save
            end
       end

    end
end

