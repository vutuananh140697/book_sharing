class CategoriesController < ApplicationController
  before_action :find_type, only: [:show]

  def show
    per_page = params[:page]
    @books = @type.books.order(publish_date: :desc).page(per_page).per 12
  end

  private

  def find_type
    @type = Category.find_by id: params[:id]

    return if @type.present?
    flash[:danger] = t "flash.types.not_found"
    redirect_to root_path
  end
end
