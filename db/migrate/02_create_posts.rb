class CreatePosts < ActiveRecord::Migration[4.2]
  def change
    create_table :posts do |a|
      a.string :title
      a.integer :author_id
      a.integer :band_id
      a.text :post
    end
  end
end
