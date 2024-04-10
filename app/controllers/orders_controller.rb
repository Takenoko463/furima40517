include AuthenticateUserActions # rubocop:disable Style/MixinUsage

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :retrieve_all_active_hash
  before_action :you_seller!
  before_action :sold_out!
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_shipping_address_form = OrderShippingAddressForm.new
  end

  def create
    @order_shipping_address_form = OrderShippingAddressForm.new(order_params)
    if @order_shipping_address_form.valid?
      pay_item
      @order_shipping_address_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render action: :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def retrieve_all_active_hash
    @prefectures = Prefecture.all
  end

  def order_params
    params.require(:order_shipping_address_form).permit(:postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_number).merge(
      item_id: @item.id, user_id: current_user.id, token: params[:token]
    )
  end

  def you_seller!
    return unless your_item?

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end
