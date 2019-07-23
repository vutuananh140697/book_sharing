class LikesController < ApplicationController
  before_action :find_review, only: [:create, :destroy]
  before_action :find_like, only: :destroy

  def create
    likes = @review.likes
    like = likes.create user_id: current_user.id

    render json: {likes_count: likes.size, like_id: like.id}
  end

  def destroy
    @like.destroy
    render json: {likes_count: @review.likes.size}
  end

  private
  def find_review
    @review = Review.find_by id: params[:review_id]
  end

  def find_like
    @like = Like.find_by id: params[:id]
  end
end
