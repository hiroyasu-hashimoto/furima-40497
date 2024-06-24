class User < ApplicationRecord
  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase_records

  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :name_last, presence: true, format: { with: VALID_NAME_REGEX }
  validates :name_first, presence: true, format: { with: VALID_NAME_REGEX }
  validates :katakana_last, presence: true, format: { with: VALID_KANA_NAME_REGEX }
  validates :katakana_first, presence: true, format: { with: VALID_KANA_NAME_REGEX }
  validates :birthday, presence: true
end
