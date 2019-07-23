class CreateSuggestBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :suggest_books do |t|
      t.integer :from_id
      t.integer :to_id
      t.integer :book_id
      t.text :content

      t.timestamps
    end
  end
end
