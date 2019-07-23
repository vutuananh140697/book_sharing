class StaticPagesController < ApplicationController
  def index
    q = params[:q]
    per_page = params[:page]
    @books = Book.ransack(title_or_isbn_or_authors_name_cont: q).result.page(per_page).per(4)
    @users = User.ransack(username_or_name_cont: q).result.page(per_page).per(4)
    @items = @books + @users
  end

  def show
    per_page = params[:page]
    @reviews = Review.all.order(created_at: :desc).page(per_page).per(4)
    @top_books = Book.all.sort_by{|p| p.average_rate}.reverse.take(10)
    @top_users = User.all.sort_by{|p| p.count_getted_like}.reverse.take(5)
  end
end
