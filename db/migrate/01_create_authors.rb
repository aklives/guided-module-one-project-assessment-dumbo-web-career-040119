class CreateAuthors < ActiveRecord::Migration[4.2]
  def change
    create_table :authors do |a|
      a.string :name
    end
  end
end
