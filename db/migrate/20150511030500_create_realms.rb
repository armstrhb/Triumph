class CreateRealms < ActiveRecord::Migration
  def change
    create_table :realms do |t|
      t.string :name, null: false
      t.boolean :active, default: true
      t.belongs_to :group
      t.belongs_to :icon
      t.string :color, default: "\#c0c0c0"
      t.timestamps null: false
    end

    create_table :realm_users, id: false do |t|
      t.belongs_to :realm, index: true
      t.belongs_to :user, index: true
    end
  end
end
