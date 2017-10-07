class AddBodyAndUserAndAvatarAndViewToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :body, :text
    add_column :blogs, :user_id, :integer
    add_column :blogs, :avatar, :string
    add_column :blogs, :view, :integer
  end
end
