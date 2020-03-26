class ChangeColumnToRecipe < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :title, :string, null: false
    change_column :recipes, :image, :string, null: false
    change_column :recipes, :time, :integer, null: false
    change_column :recipes, :serving, :integer, null: false

  end
end
