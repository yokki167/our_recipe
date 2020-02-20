class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.index :title
      t.string :image
      t.integer :time
      t.integer :serving

      # t.references :user, foreign_key: true
      # t.references :recipelist, foreign_key: true
      t.timestamps
    end
  end
end
