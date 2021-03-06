class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  validates :nickname, :birthday, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/i }
  # validates :password, confirmation: true
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }

  

  # validates :name, presence: true
  has_one :cards
  has_one :address
  has_one :creditcard

  has_many :comments
  has_many :items
end
