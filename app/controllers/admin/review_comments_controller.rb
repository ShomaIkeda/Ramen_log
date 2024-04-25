class Admin::ReviewCommentsController < ApplicationController
  
  
  def index
    @review_comments = Review.find(params[:review_id]).review_comments.page(params[:page])
    
    
  end
  
  
  private

  def review_comment_params
    params.require(:review_comment).permit(:comment, :review_id, :user_id)
  end
  
end

