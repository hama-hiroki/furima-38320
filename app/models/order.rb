class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :profile
  has_one_attached :image
end
