class ChangeColumnToRecipe1 < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :worktime, :integer, null: false

  end
end
