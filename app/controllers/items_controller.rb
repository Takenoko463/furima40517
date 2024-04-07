class ItemsController < ApplicationController
  def index
    @items = item.all
  end
end
