class BuysController < ApplicationController
  before_action :set_item

  def index
    @buy = Buy.new
  end

  def create
  end


  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end

end
