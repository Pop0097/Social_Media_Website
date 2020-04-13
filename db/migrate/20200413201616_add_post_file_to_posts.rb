class AddPostFileToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :post_file, :string
  end
end
