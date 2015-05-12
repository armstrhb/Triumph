class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :title, null: false
      t.belongs_to :realm
      t.belongs_to :category
      t.belongs_to :rarity
      t.integer :points
      t.date :active_start
      t.date :active_end
      t.boolean :repeatable, default: false
      t.integer :required_ticks
      t.string :description, null: false
      t.timestamps null: false
    end
  end
end
