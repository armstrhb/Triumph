class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.index :name
      t.string :email, null: false
      t.boolean :active, default: true
      t.timestamps null: false
    end
  end
end
