class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # データの型
  validates :price, numericality: { only_integer: true }
  # 文字数や、選択肢の上限
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :category_id, comparison: { less_than: 11 }
  validates :condition_id, comparison: { less_than: 8 }
  validates :which_delivery_payment_id, comparison: { less_than: 4 }
  validates :prefecture_id, comparison: { less_than: 49 }
  validates :time_for_delivery_id, comparison: { less_than: 5 }
  validates :price, comparison: { greater_than: 299, less_than: 10_000_000 }

  # 空白での投稿を阻止
  validates :name, presence: true
  validates :description, :price, presence: true
  validates :category_id, :condition_id, :which_delivery_payment_id, :prefecture_id, :time_for_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
  # アソシエーション
  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to :category
  belongs_to :condition
  belongs_to :which_delivery_payment
  belongs_to :prefecture
  belongs_to :time_for_delivery
end
