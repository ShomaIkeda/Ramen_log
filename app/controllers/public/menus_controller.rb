class Public::MenusController < ApplicationController
  
   before_action :authenticate_user!
  
  def new
    @menu = Menu.new
    
  end
  
  def index
    @menus = Shop.find(params[:shop_id]).menus.page(params[:page])
    @all_menus_count = @menus.count
    
   
  end
  
  def create
    shop = Shop.find(params[:shop_id])
    
    @menu = Review.new(menu_params)
    @menu.shop_id = shop.id
    @menu.genre_id = genre.id
    @menu.save ? (redirect_to shop_menu_path(shop.id, @menu.id)) : (render :new)
  end
  
   def show
     @menu = Menu.find(params[:id])
   end

  def edit
  end
  
  def update
    @menu.update(shop_params) ? (redirect_to menu_path(@menu)) : (render :edit)
  end
  
  private

  def menu_params
    params.require(:menu).permit(:genre_id, :shop_id, :name,:price )
  end
  
end


