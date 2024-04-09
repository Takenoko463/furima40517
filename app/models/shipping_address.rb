class ShippingAddress < ApplicationRecord
  # 空白での投稿を禁止
  validates :postal_code, :city, :house_num, :phone_number, presence: true

  # 空白である選択を禁止
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  # 電話番号、郵便番号の形式指定
  # 　「-」必須
  validates :postal_code, format: {
    with: /\A\d{3}-\d{4}\z/,
    message: 'is invalid'
  }

  validates :phone_number, format: {
    with: /\A\d{1,4}-\d{1,4}-\d{4}\z/,
    message: 'is invalid'
  }

  # アソシエーション
  belongs_to :order
  belongs_to :prefecture
end
