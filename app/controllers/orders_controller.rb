class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_column_for_index, only: [:index, :create]
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

  def authenticate_user!
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def set_column_for_index
    @item = Item.find(params[:item_id])
    @prefectures = Prefecture.all
  end

  def order_params
    item_id = params[:item_id]
    params.require(:order_shipping_address_form).permit(:postal_code, :prefecture_id, :city, :house_num, :building_name,
                                                        :phone_number).merge(item_id:, user_id: current_user.id)
  end
end
