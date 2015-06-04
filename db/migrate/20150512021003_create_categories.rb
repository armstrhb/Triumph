class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.index :name
      t.belongs_to :realm
      t.timestamps null: false
    end
  end
end
