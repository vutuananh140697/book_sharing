class CreateAuthorBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :author_books do |t|
      t.integer :author_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
