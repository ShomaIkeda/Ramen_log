class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!,except: [:show, :index]
  
  def new
    @review = Review.new
  end
  
  def index
    @reviews = Shop.find(params[:shop_id]).reviews.page(params[:page])
    @all_reviews_count = @reviews.count
  end
  
  def create
    shop = Shop.find(params[:shop_id])
    
    @review = Review.new(review_params)
    @review.shop_id = shop.id
    @review.user_id = current_user.id
    @review.save ? (redirect_to shop_review_path(shop.id, @review.id)) : (render :new)
  end
  
  def show
     @review = Review.find(params[:id])
     @review_comment = ReviewComment.new
  end

  def edit
  end
  
  def update
    @review.update(shop_params) ? (redirect_to review_path(@review)) : (render :edit)
  end
  
  private

  def review_params
    params.require(:review).permit(:shop_id, :user_id, :review_comment_id, :title, :eated_menu, :comment,  :star)
  end
  
end