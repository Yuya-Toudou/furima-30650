FactoryBot.define do
  factory :item do
    name { Faker::String.random }
    description { Faker::String.random }
    category_id { rand(1..10) }
    condition_id { rand(1..6) }
    postage_pay_id { rand(1..2) }
    prefectures_id { rand(1..47) }
    posting_date_id { rand(1..3) }
    price { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
