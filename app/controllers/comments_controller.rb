class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :find_review
  before_action :find_comment, only: [:update, :destroy]

  def create
    comments = @review.comments
    comment = @review.comments.build comment_params
    comment.user_id = current_user.id
    if comment.save
      flash[:success] = t "flash.comments.update_success"
    else
      flash[:danger] = t "flash.destroy_fail"
    end

    render json: {comments_count: comments.size, comment_id: comment.id}
  end

  def update
    @comment.review_id = params[:review_id]
    if @comment.update comment_params.merge user_id: current_user.id
      flash[:success] = t "flash.comments.update_success"
    else
      flash[:danger] = t "flash.destroy_fail"
    end
  end

  def destroy
    comments = @review.comments
    if (comments.include? @comment) && comments.delete(@comment)
      flash[:success] = t "flash.comments.destroy_success"
    else
      flash[:danger] = t "flash.destroy_fail"
    end

    render json: {comments_count: @review.comments.size}
  end

  private

  def comment_params
    params.require(:comment).permit :content, :review_id, :user_id
  end

  def find_comment
    @comment = @review.comments.find_by id: params[:id]

    return if @comment
    flash[:danger] = t "flash.comments.not_found"
    redirect_to reviews_path @review
  end

  def find_review
    @review = Review.find_by id: params[:review_id]
    
    return if @review.present?
    flash[:danger] = t "flash.reviews.not_found"
    redirect_to root_path
  end
end
