class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, uniqueness: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)/i }

         with_options presence: true do
          validates :name

           with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
            validates :last_name_full
            validates :first_name_full
          end

          with_options format: { with: /\A[ァ-ン]/ } do
            validates :last_name_kana
            validates :first_name_kana
          end
          
         validates :birth_date, presence: true
        end

end
has_many :items