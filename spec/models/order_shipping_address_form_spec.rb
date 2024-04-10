require 'rails_helper'

RSpec.describe OrderShippingAddressForm, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_shipping_address_form = FactoryBot.build(:order_shipping_address_form, user_id: user.id, item_id: item.id)
  end
  describe '商品の購入' do
    context '商品の購入に成功' do
      it '全ての値が正しく入力されている' do
        expect(@order_shipping_address_form).to be_valid
      end
      it '建物名だけが空白である' do
        @order_shipping_address_form.building_name = ''
        expect(@order_shipping_address_form).to be_valid
      end
    end
    context '商品の購入に失敗' do
      it '郵便番号が空白である' do
        @order_shipping_address_form.postal_code = ''
        @order_shipping_address_form.valid?
        expect(@order_shipping_address_form.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県が選択されていない' do
        @order_shipping_address_form.prefecture_id = 1
        @order_shipping_address_form.valid?
        expect(@order_shipping_address_form.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村名が空白である' do
        @order_shipping_address_form.city = ''
        @order_shipping_address_form.valid?
        expect(@order_shipping_address_form.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空白である' do
        @order_shipping_address_form.house_num = ''
        @order_shipping_address_form.valid?
        expect(@order_shipping_address_form.errors.full_messages).to include "House num can't be blank"
      end
      it '電話番号が空白である' do
        @order_shipping_address_form.phone_number = ''
        @order_shipping_address_form.valid?
        expect(@order_shipping_address_form.errors.full_messages).to include "Phone number can't be blank"
      end
      it '商品と結びついていない' do
        # @order_shipping_address_form.item_id = nil
        # @order_shipping_address_form.valid?
        # binding.pry
        # expect(@order_shipping_address_form.errors.full_messages).to include 'Item must exist'
      end
      it 'ユーザーと結びついていない' do
        # @order_shipping_address_form.user_id = nil
        # @order_shipping_address_form.valid?
        # binding.pry
      end
      it '郵便番号の記載が正しくない' do
      end
      it '電話番号の記載が正しくない' do
      end
    end
  end
end
