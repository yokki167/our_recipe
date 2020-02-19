class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :iname, index: true
      t.string :amount
      t.integer :serving
      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
