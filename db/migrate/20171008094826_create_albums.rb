class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.integer :views
      t.string :cover

      t.timestamps
    end
  end
end
