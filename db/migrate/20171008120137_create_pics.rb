class CreatePics < ActiveRecord::Migration[5.1]
  def change
    create_table :pics do |t|
      t.integer :album_id
      t.integer :view
      t.string :link

      t.timestamps
    end
  end
end
