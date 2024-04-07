class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :category_id, comparison: { less_than: 11 }
  validates :condition_id, comparison: { less_than: 7 }
  validates :which_delivery_payment_id, comparison: { less_than: 3 }
  validates :prefecture_id, comparison: { less_than: 48 }
  validates :time_for_delivery_id, comparison: { less_than: 4 }
  validates :price, comparison: { greater_than: 299, less_than: 10_000_000 }

  validates :name, :description, :price, presence: true

  validates :category_id, numericality: { other_than: 1 }

  belongs_to :user
  belongs_to :category
end
