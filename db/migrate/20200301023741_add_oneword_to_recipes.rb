class AddOnewordToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :oneword, :string
  end
end
