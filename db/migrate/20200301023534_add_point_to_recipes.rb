class AddPointToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :point, :string
  end
end
