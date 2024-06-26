include AuthenticateUserActions # rubocop:disable Style/MixinUsage

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :retrieve_all_active_hash, only: [:new, :edit, :create, :update]
  before_action :you_buyer!, only: [:edit, :update, :destroy]
  before_action :sold_out!, only: [:edit, :update, :destroy]
  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    # 空の商品情報
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :which_delivery_payment_id,
                                 :prefecture_id, :time_for_delivery_id, :price).merge(user_id: current_user.id)
  end

  def you_buyer!
    return if your_item?

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def retrieve_all_active_hash
    @categories = Category.all
    @conditions = Condition.all
    @which_delivery_payments = WhichDeliveryPayment.all
    @prefectures = Prefecture.all
    @time_for_deliveries = TimeForDelivery.all
  end
end
