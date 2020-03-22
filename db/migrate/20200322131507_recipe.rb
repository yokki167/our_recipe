class Recipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :dish_id, :integer
    add_column :recipes, :mainmaterial_id, :integer
    add_column :recipes, :eattime_id, :integer
  end
end
