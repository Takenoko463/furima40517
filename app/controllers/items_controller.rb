class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :create]
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

  def create
    @items = Item.new(item_params)
    @items.save
    return unless @items.save

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :which_delivery_payment_id,
                                 :prefecture_id, :time_for_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
