class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :picture
      t.datetime :publish_date

      t.timestamps
    end
  end
end
