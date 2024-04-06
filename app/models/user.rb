class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nick_name, presence: true

  kanji_reg = '\A[一-龥]+\z'
  validates :name_last_w, :name_first_w, presence: true, format: { with: /#{kanji_reg}/,
                                                                   message: 'is not Kanji' }
  katakana_reg = '\A[ァ-ヶー－]+\z'
  validates :name_last_r, :name_first_r, presence: true, format: { with: /#{katakana_reg}/,
                                                                   message: 'is not full width Katakana' }
end
