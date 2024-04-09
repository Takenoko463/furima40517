class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @shipping_address = @order.shipping_address
    @prefectures = Prefecture.all
  end

  def create
    @prefectures = Prefecture.all
    # binding.pry
    @order = OrderShippingAddressForm.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    item_id = params[:item_id]
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_num, :building_name,
                                  :phone_number).merge(item_id:, user_id: current_user.id)
  end
end
