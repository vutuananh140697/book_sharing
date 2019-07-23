class SuggestBook < ApplicationRecord
  belongs_to :book

  class << self
    def create_suggest_book suggest_books_params, book, from_id
      ActiveRecord::Base.transaction do
        to_ids = suggest_books_params[:to_id].reject &:blank?
        @suggest_books = []
        to_ids.each do |to_id|
          @suggest_book = SuggestBook.create! book_id: book.id,
            from_id: from_id, to_id: to_id,
            content: suggest_books_params[:content]
          @suggest_books.push @suggest_book
        end
      end
      return @suggest_books if @suggest_book.save
      nil
    end
  end
end
