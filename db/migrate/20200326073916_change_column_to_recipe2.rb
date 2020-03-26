class ChangeColumnToRecipe2 < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :title, :string, limit: 55

  end
end
