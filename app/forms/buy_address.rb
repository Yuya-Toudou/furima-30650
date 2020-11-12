class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :zip_code, :prefectures_id, :municipality, :address, :house_name, :phone_number, :item_id

  with_options presence: true do
    validates :token
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefectures_id, numericality: { other_than: 0, message: 'Select' }
    validates :municipality
    validates :address
    validates :phone_number, numericality: true, length: { maximum: 11 }
  end

  def save
    buy = Buy.create(item_id: item_id)
    DeliveryDestination.create(zip_code: zip_code, prefectures_id: prefectures_id, municipality: municipality, address: address, house_name: house_name, phone_number: phone_number, buy_id: buy.id)
  end
end
