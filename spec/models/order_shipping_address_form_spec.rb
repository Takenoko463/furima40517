require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBOt.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.buld(:order_shipping_address, user_id: user.id, item_id: item.id)
  end
  describe '商品の購入' do
    context '商品の購入に成功' do
      it '全ての値が正しく入力されている' do
        expect(@order_shipping_address).to be_valid
      end
      it '建物名だけが空白である' do
      end
    end
    context '商品の購入に失敗' do
      it '郵便番号が空白である' do
      end
      it '都道府県が選択されていない' do
      end
      it '市区町村名が空白である' do
      end
      it '商品と結びついていない' do
      end
      it 'ユーザーと結びついていない' do
      end
      it '郵便番号の記載が正しくない' do
      end
      it '電話番号の記載が正しくない' do
      end
    end
  end
end
