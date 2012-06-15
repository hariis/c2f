 module OrderHelper
    def get_api_handle
     BigCommerce::Api.new({
            :store_url => "https://store-6dfb2.mybigcommerce.com",
            :username  => "apiuser",
            :api_key   => "7dd8478259753daec9323f0f0f012b59"
            })
    end
    def order_already_exists?(order_id)
      find_by_parent_order_id(order_id)
    end

    def create_new_order(jo)
      o = Order.new(:parent_order_id => jo["id"], :date_created => jo["date_modified"], :status => jo["status"], :customer_message => jo["customer_message"],
            :is_deleted => jo["is_deleted"])

      o.save
      return o
    end

    def create_new_product(product, o)
      p = Product.new(:name => product["name"], :base_price => product["base_price"].to_f, :quantity => product["quantity"], :order_id => o.id,
              :product_id => product["product_id"].to_i)
      #get the product details to get the brand
      actual_product = @api.get_product(product["product_id"].to_s)
      p.brand_id = actual_product ? actual_product["brand_id"] : -1.to_s

      p.save
    end
end

