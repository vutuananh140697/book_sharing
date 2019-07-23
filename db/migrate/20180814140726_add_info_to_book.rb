class AddInfoToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :isbn, :string
    add_column :books, :publisher, :string
  end
end
