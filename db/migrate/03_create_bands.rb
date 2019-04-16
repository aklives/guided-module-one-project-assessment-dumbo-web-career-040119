class CreateBands < ActiveRecord::Migration[4.2]
  def change
    create_table :bands do |a|
      a.string :name
    end
  end
end
