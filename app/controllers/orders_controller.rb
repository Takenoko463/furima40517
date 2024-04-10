include AuthenticateUserActions # rubocop:disable Style/MixinUsage

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :retrieve_all_active_hash
  before_action :you_seller!
  def index
    @order_shipping_address_form = OrderShippingAddressForm.new
  end

  def create
    @order_shipping_address_form = OrderShippingAddressForm.new(order_params)
    if @order_shipping_address_form.valid?
      @order_shipping_address_form.save
      redirect_to root_path
    else
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
    params.require(:order_shipping_address_form).permit(:postal_code, :prefecture_id, :city, :house_num, :building_name,
                                                        :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end

  def you_seller!
    # binding.pry
    return unless your_item?

    redirect_to root_path
  end
end
