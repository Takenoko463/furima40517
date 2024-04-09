class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @shipping_address = ShippingAddress.new
    @prefectures = Prefecture.all
  end
end
