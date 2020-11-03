class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :last_name_full, presence: true
  validates :first_name_full, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true
end
