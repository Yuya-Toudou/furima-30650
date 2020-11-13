FactoryBot.define do
  factory :buy_address do
    token { 'tok_1234567890abcdefghijklmnopqr' }
    zip_code { '123-4567' }
    prefectures_id { 1 }
    municipality { 'テスト村' }
    address { '1-1' }
    house_name { 'テストハイツ' }
    phone_number { '09012345678' }
  end
end
