class Public::ReviewCommentsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @review_comments = Review.find(params[:review_id]).review_comments.page(params[:page])
    @review = Review.find(params[:review_id])
    # @review_comments.user_id = current_user.id

  end

  def create
    review = Review.find(params[:review_id])
    comment = current_user.review_comments.new(review_comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to review_review_comments_path(review)
  end

  def destroy
    @review = Review.find(params[:review_id])
    @review_comment = @review.review_comments.find(params[:id])
    

    if @review_comment.destroy
    redirect_to review_review_comments_path(@review.id)
    end
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment, :review_id, :user_id)
  end

end
