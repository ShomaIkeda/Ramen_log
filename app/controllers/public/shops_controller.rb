class Public::ShopsController < ApplicationController
  before_action :authenticate_user!,except: [:show, :index]

  def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.all.page(params[:page])
    @all_shops_count = @shops.count
    #@shops = all_shops.page(params[:page])
    #@all_shops_count = all_shops.count
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save ? (redirect_to shop_path(@shop)) : (render :new)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params) ? (redirect_to shop_path(@shop)) : (render :edit)
  end

  def menu
    @menu = Menu.new
    @shop = Shop.find(params[:id])
    @menus = @shop.menus.page(params[:page]).per(12)
    # mazi?
  end

  def review

    @reviews = all_reviews.page(params[:page])
    @all_reviews_count = all_reviews.count
  end

  def new_review
     @review = Review.new
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :address, :telephone_number, :opening_time, :holiday, )
  end

end
