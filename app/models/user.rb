class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nick_name, presence: true

  ## 本名に関する規制
  kanji_reg = '\A[一-龥]+\z'
  validates :name_last_w, :name_first_w, presence: true, format: { with: /#{kanji_reg}/,
                                                                   message: 'is not Kanji' }
  katakana_reg = '\A[ァ-ヶー－]+\z'
  validates :name_last_r, :name_first_r, presence: true, format: { with: /#{katakana_reg}/,
                                                                   message: 'is not full width Katakana' }
  ## 誕生日の最小、最大値
  start_date = Date.new(1920, 1, 1)
  ## Date.today実行時にvalidationを避ける
  end_date = ->(_x) { Date.today }
  validates :birth_day, comparison: { greater_than: start_date, less_than: end_date[0] }
end
