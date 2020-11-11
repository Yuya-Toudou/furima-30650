require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '新規出品がうまくいくとき' do
      it '正規の値が存在すれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '新規出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image must be attached')
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryを選択しないと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'conditionを選択しないと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end
      it 'postage_payを選択しないと出品できない' do
        @item.postage_pay_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage pay must be other than 0')
      end
      it 'prefecturesを選択しないと出品できない' do
        @item.prefectures_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures must be other than 0')
      end
      it 'posting_dateを選択しないと出品できない' do
        @item.posting_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Posting date must be other than 0')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300以下だと出品できない' do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9,999,999以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
