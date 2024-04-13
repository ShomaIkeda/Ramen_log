class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @shop = Shop.new
  end
  
  def index
    @shops = all_shops.page(params[:page])
    @all_shops_count = all_shops.count
  end
  
  def create
    @shop = Shop.new(shop_params)
    @shop.save ? (redirect_to admin_shop_path(@shop)) : (render :new)
  end
  
   def show
     @shop = Shop.find(params[:id])
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
