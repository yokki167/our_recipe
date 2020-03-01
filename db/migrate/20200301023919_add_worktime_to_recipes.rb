class AddWorktimeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :worktime, :integer
  end
end
