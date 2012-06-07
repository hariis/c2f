class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :parent_order_id
      t.datetime :date_created
      t.string :status
      t.string :customer_message
      t.boolean :is_deleted

      t.timestamps
    end
  end
end

