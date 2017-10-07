class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text :body
      t.integer :user_id
      t.string :avatar
      t.integer :view

      t.timestamps
    end
  end
end
