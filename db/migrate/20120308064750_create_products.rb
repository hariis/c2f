class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :name
      t.string :description
      t.float :base_price
      t.integer :quantity
      t.string :brand_id
      t.references :order
      t.timestamps
    end
  end
end

