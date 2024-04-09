class OrderShippingAddressForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_num, :building_name,
                :phone_number, :item_id, :user_id

  def save
    order = Order.create(user_id:, item_id:)
    ShippingAddress.create(postal_code:, prefecture_id:, city:, house_num:, building_name:, phone_number:, order_id: order.id)
  end
end
