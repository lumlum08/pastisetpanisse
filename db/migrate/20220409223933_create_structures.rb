class CreateStructures < ActiveRecord::Migration[6.1]
  def change
    create_table :structures do |t|
      t.string :name
      t.string :address
      t.string :category
      t.integer :cp
      t.string :district
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
