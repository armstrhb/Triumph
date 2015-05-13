class CreateRarities < ActiveRecord::Migration
  def change
    create_table :rarities do |t|
      t.string :name, null: false
      t.index :name
      t.belongs_to :realm
      t.timestamps null: false
    end
  end
end
