class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nick_name, presence: true

  # passwordの条件
  english_or_num = '\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z'
  validates :password, format: {
    with: /#{english_or_num}/i,
    message: 'must have English and Number'
  }

  ## 本名に関する規制
  full_width_reg = '\A[ぁ-んァ-ヶ一-龥々ー]+\z'
  validates :name_last_w, :name_first_w, presence: true, format: { with: /#{full_width_reg}/,
                                                                   message: 'must be Kanji' }
  katakana_reg = '\A[ァ-ヶー－]+\z'
  validates :name_last_r, :name_first_r, presence: true, format: { with: /#{katakana_reg}/,
                                                                   message: 'must be full width Katakana' }
  ## 誕生日の最小、最大値
  start_date = Date.new(1920, 1, 1)
  ## Date.today実行時にvalidationを避ける
  end_date = ->(_x) { Date.today }
  validates :birth_day, comparison: { greater_than: start_date, less_than: end_date[0] }
end
