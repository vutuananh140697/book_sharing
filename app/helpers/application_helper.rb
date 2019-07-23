module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app_name"
    page_title.empty? ? base_title : "#{page_title} - #{base_title}"
  end
  
  def like review
    review.likes.find_by user_id: current_user.id
  end
  
  def author_rate(book, user)
    rates = book.rates.where(user_id: user.id)
    size = rates.size
    total = 0
    rates.each do |rate|
      total += rate.score
    end
    return total * 1.0 / size if size > 0
    0
  end

  def rate movie
    movie.rates.find_by user_id: current_user.id
  end

end
