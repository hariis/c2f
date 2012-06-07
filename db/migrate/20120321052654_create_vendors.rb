class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :email
      t.string :password_digest
      t.string :brand_id

      t.timestamps
    end
  end
end

