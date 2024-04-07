class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    # 空の商品情報
    @item = Item.new
    # アクティブハッシュの情報
    @categories = Category.all
    @conditions = Condition.all
    @which_delivery_payments = WhichDeliveryPayment.all
    @prefectures = Prefecture.all
    @time_for_deliveries = TimeForDelivery.all
  end
end
