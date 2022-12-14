class Form
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :municipalities, :address,
                :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: '例）123-4567' }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\d{10,11}/ }, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Profile.create(post_code: post_code, shipping_area_id: shipping_area_id,
                   municipalities: municipalities, address: address, building_name: building_name,
                   phone_number: phone_number, order_id: order.id)
  end
end
