class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :book_id
      t.float :score

      t.timestamps null: false
    end
  end
end
