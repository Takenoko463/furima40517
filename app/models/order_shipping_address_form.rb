class OrderShippingAddressForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_number, :item_id, :user_id, :token

  # user,itemモデルと紐付けている
  validates :item_id, :user_id, presence: {
    message: 'must exist'
  }

  # 空白での投稿を禁止
  validates :postal_code, :city, :house_num, :phone_number, :token, presence: true

  # 空白である選択を禁止
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  # 電話番号、郵便番号の形式指定
  # 　「-」必須
  validates :postal_code, format: {
    with: /\A\d{3}-\d{4}\z/,
    message: 'is invalid'
  }

  validates :phone_number, format: {
    with: /\A\d{10}\z/,
    message: 'is invalid'
  }
  def save
    order = Order.create(user_id:, item_id:)
    ShippingAddress.create(postal_code:, prefecture_id:, city:, house_num:, building_name:, phone_number:, order_id: order.id)
  end
end
