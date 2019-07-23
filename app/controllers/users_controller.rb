class UsersController < ApplicationController
  before_action :find_user
  
  def show
    per_page = params[:page]
    @reviews = @user.reviews.order(created_at: :desc).page(per_page).per 4
  end
  
  def reviews
    @reviews = @user.reviews.order(created_at: :desc)
      .page(params[:page]).per(10)
  end
  
  def following
    per_page = params[:page]
    @user  = User.find(params[:id])
    @users = @user.following.page(per_page).per 10
  end

  def followers
    per_page = params[:page]
    @user  = User.find(params[:id])
    @users = @user.followers.page(per_page).per 10
  end
  
  private

  def find_user
    @user = User.find_by id: params[:id]

    return if @user.present?
    flash[:danger] = "User not found"
    redirect_to root_path
  end
end
