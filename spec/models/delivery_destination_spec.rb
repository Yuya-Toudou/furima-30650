require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe 'create' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
    end

    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buy_address).to be_valid
      end
      it 'house_nameは空でも購入できること' do
        @buy_address.house_name = nil
        expect(@buy_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空だと購入できないこと' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'zip_codeが空だと購入できないこと' do
        @buy_address.zip_code = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んでいないと購入できないこと' do
        @buy_address.zip_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Zip code Input correctly')
      end
      it 'prefectureを選択していないと購入できないこと' do
        @buy_address.prefectures_id = 0
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Prefectures Select')
      end
      it 'municipalityが空だと購入できないこと' do
        @buy_address.municipality = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberは空だと購入できないこと' do
        @buy_address.address = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @buy_address.phone_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが含まれていると購入できないこと' do
        @buy_address.phone_number = '090-123-1234'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberが12桁以上と購入できないこと' do
        @buy_address.phone_number = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
