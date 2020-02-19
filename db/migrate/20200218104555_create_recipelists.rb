class CreateRecipelists < ActiveRecord::Migration[5.2]
  def change
    create_table :recipelists do |t|
      t.string :text 
      t.string :image
      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
