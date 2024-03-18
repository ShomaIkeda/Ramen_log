class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @review = Review.new
  end
  
  def index
    @reviews = all_reviews.page(params[:page])
    @all_reviews_count = all_reviews.count
  end
  
  def create
    @review = Review.new(review_params)
    @review.save ? (redirect_to review_path(@review)) : (render :new)
  end
  
   def show
   end

  def edit
  end
  
  def update
    @review.update(shop_params) ? (redirect_to review_path(@review)) : (render :edit)
  end
  
  private

  def review_params
    params.require(:review).permit(:shop_id, :user_id, :title, :eated_menu, :comment, :score)
  end
  
end
