class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @reviews = Shop.find(params[:shop_id]).reviews.page(params[:page])
    @all_reviews_count = @reviews.count
    
  end
  
  
  def show
     @review = Review.find(params[:id])
    
  end
  
  
  def destroy
    @review = Review.find(params[:id])
    @shop = @review.shop
    
    if @review.destroy
      redirect_to admin_shop_reviews_path(@shop)
    end
    
    
  end
  
   private

  def review_params
    params.require(:review).permit(:shop_id, :user_id, :review_comment_id, :title, :eated_menu, :comment,  :star)
  end
  
  
end
