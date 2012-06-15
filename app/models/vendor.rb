class Vendor < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :brand_id
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :brand_id
  #todo add validation for email
  NAMES = { "3" => "KooKoolan Farms", "4" => "JandK Growers", "-1" => "Admin" }
  CHOOSE_VIEW = { "All Pending Orders" => "-1", "KooKoolan Farms" => "3" , "JandK Growers" => "4"}
end

