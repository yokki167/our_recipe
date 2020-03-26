class ChangeColumnToRecipe3 < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :title, :string

  end
end
