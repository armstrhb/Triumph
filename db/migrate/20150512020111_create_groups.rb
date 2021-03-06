class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.index :name
      t.integer :admin_id
      t.timestamps null: false
    end

    create_table :user_groups, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
    end
  end
end
