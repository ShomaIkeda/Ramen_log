class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.all.page(params[:page])
    @all_shops_count = @shops.count
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save ? (redirect_to admin_shop_path(@shop)) : (render :new)
  end

   def show
     @shop = Shop.find(params[:id])
   end

  def edit
     @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params) ? (redirect_to admin_shop_path(@shop)) : (render :edit)
  end
  
  def destroy
    @shop = Shop.find(params[:id])
    
    if @shop.destroy
    redirect_to admin_shops_path
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :address, :telephone_number, :opening_time, :holiday, )
  end


end
