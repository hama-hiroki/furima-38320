class Item < ApplicationRecord

  belongs_to :user
  #has_one   :order
  has_one_attached :image

  validates :user,                presence: true
  validates :name,                presence: true
  validates :product_description, presence: true
  validates :category_id ,        presence: true
  validates :condition_id,        presence: true
  validates :shipping_charge_id,  presence: true
  validates :shipping_area_id,    presence: true
  validates :estimated_shipping_date_id, presence: true
  validates :price,               presence: true
end
