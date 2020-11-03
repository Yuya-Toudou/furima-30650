class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)/i }

  validates :last_name_full, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name_full, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :last_name_kana, presence: true,  format: { with: /\A[ァ-ン]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]/ }
  validates :birth_date, presence: true
end
