FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email { Faker::Internet.email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name_full { '鈴木' }
    first_name_full { '一郎' }
    last_name_kana { 'スズキ' }
    first_name_kana { 'イチロウ' }
    birth_date { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
