class Admin::ReviewCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @review_comments = Review.find(params[:review_id]).review_comments.page(params[:page])
    @review = Review.find(params[:review_id])
    
  end
  
  def destroy
    @review = Review.find(params[:review_id])
    @review_comment = @review.review_comments.find(params[:id])
    
    if @review_comment.destroy
    redirect_to admin_review_review_comments_path
    end
  end
  
  
  private

  def review_comment_params
    params.require(:review_comment).permit(:comment, :review_id, :user_id)
  end
  
end

