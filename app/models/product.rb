class Product < ActiveRecord::Base
  has_many :order_items
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
