class CreateRarities < ActiveRecord::Migration
  def change
    create_table :rarities do |t|
      t.string :name, null: false
      t.index :name
      t.belongs_to :realm
      t.belongs_to :icon
      t.string :color, default: "\#c0c0c0"
      t.integer :rareness, null: false
      t.string :description, null: false
      t.timestamps null: false
    end
  end
end
