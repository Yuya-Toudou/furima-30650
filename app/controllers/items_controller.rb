class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_pay_id, :prefectures_id, :posting_date_id, :price).merge(user_id: current_user.id)
  end
end
