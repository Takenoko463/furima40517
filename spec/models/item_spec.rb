require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '商品の出品を行える場合' do
      it 'name description 画像、各種id全てを持ち、userも指定されている場合' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品を行えない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'which_delivery_payment_idが空では登録できない' do
        @item.which_delivery_payment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Which delivery payment can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'time_for_delivery_idが空では登録できない' do
        @item.time_for_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Time for delivery can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'userを指定しないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
      it 'priceは300円以上でないといけない' do
        @item.price = 201
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 299'
      end
      it 'priceは9_999_999円以下でないといけない' do
        @item.price = 1_000_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
      it 'priceは数字でないといけない' do
        @item.price = "'2'"
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
