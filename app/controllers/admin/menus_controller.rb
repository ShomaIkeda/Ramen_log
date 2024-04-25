class Admin::MenusController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @menu = Menu.new
  end

  def index
    @shop =  Shop.find(params[:shop_id])
    @menus = @shop.menus.page(params[:page])
    @all_menus_count = @menus.count
  end

  def create
    shop = Shop.find(params[:shop_id])
    genre = Genre.find(menu_params[:genre_id])
    @menu = Menu.new(menu_params)
    @menu.shop_id = shop.id
    @menu.genre_id = genre.id
    @menu.save ? (redirect_to shop_menus_path(shop.id, @menu.id)) : (render :new)
  end

   def show
     @menu = Menu.find(params[:id])
   end

  def edit
  end

  def update
    @menu.update(shop_params) ? (redirect_to menu_path(@menu)) : (render :edit)
  end

  def destroy
  @shop = Shop.find(params[:shop_id])
  @menu = @shop.menus.find(params[:id])

  if @menu.destroy
    redirect_to shop_menus_path(@shop)
  end
  end

  private

  def menu_params
    params.require(:menu).permit(:genre_id, :shop_id, :name,:price )
  end

end

  

