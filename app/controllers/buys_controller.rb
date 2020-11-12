class BuysController < ApplicationController
  before_action :set_item

  def index
    @buy = BuyAddress.new
  end

  def create
    @buy = BuyAddress.new(buy_params)
    @buy.save
    redirect_to root_path
  end


  private

  def buy_params
    params.permit(:zip_code, :prefectures_id, :municipality, :address, :house_name, :phone_number).merge(item_id: params[:item_id], token: params[:token])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

end
