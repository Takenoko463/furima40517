class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item].id)
    @order = Order.new
  end
end
