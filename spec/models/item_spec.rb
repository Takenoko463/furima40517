require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it 'descriptionが空では登録できない' do
    end
    it 'category_idが空では登録できない' do
    end
    it 'condition_idが空では登録できない' do
    end
    it 'which_delivery_payment_idが空では登録できない' do
    end
    it 'prefecture_idが空では登録できない' do
    end
    it 'time_for_delivery_idが空では登録できない' do
    end
    it 'priceが空では登録できない' do
    end
  end
end
