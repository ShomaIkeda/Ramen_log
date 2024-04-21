class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @reviews = Shop.find(params[:shop_id]).reviews.page(params[:page])
    @all_reviews_count = @reviews.count
    
  end
  
  
  def show
     @review = Review.find(params[:id])
     @review_comment = ReviewComment.new
  end
  
  
  def destroy
    
  end
  
   private

  def review_params
    params.require(:review).permit(:shop_id, :user_id, :review_comment_id, :title, :eated_menu, :comment,  :star)
  end
  
  
end
