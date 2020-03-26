class ChangeColumnToRecipe4 < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :oneword, :string, limit: 55

  end
end
