class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
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
    @items = Item.create(item_params)
    if @items
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:content).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
