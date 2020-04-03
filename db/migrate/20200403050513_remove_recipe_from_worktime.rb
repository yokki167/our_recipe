class RemoveRecipeFromWorktime < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :worktime, :integer
  end
end
