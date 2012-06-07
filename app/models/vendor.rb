class Vendor < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :brand_id
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :brand_id
  #todo add validation for email
  NAMES = { "1" => "Kiyosaki Farms", "2" => "Mt.Hood Farms", "3" => "KooKoolan Farms", "4" => "JandK Growers", "5" => "GreenVille Farms", "-1" => "Admin" }
end

