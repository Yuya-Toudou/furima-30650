class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item
  before_action :sold_out
  before_action :move_to_index
  

  def index
    @buy = BuyAddress.new
  end

  def create
    @buy = BuyAddress.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:zip_code, :prefectures_id, :municipality, :address, :house_name, :phone_number).merge(item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out
    redirect_to root_path unless @item.buy.nil?
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif Buy.find_by(item_id: params[:item_id])
      redirect_to root_path
    end
  end

end
