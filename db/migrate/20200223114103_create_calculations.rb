class CreateCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :calculations do |t|
      t.references :recipe, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :calc

      t.timestamps
    end
  end
end
