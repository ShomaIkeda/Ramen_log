class Public::ReviewCommentsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @review_comments = Review.find(params[:review_id]).review_comments.page(params[:page])
    
  end
  
  def create
    review = Review.find(params[:review_id])
    comment = current_user.review_comments.new(review_comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to review_path(review)
  end
  
  def destroy
    ReviewComment.find(params[:id]).destroy
    redirect_to review_path(params[:review_id])
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment, :review_id, :user_id)
  end
  
end
