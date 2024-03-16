class Admin::ShopsController < ApplicationController
  
  def new
    @shop = Shop.new
  end
  
  def index
    @shops = all_shops.page(params[:page])
    @all_shops_count = all_shops.count
  end
  
  def create
    @shop = Shop.new(shop_params)
    @shop.save ? (redirect_to admin_item_path(@item)) : (render :new)
  end
  
   def show
   end

  def edit
  end
  
  def update
    @shop.update(shop_params) ? (redirect_to shop_path(@shop)) : (render :edit)
  end
  
  private

  def shop_params
    params.require(:shop).permit(:shop_name, :address, :telephone_number, :opening_time, :holiday, )
  end


end
