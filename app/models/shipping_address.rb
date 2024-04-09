class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アソシエーション
  belongs_to :order
  belongs_to :prefecture
end
