class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.timestamps
      t.string :title
      t.text :content
    end
  end
end
