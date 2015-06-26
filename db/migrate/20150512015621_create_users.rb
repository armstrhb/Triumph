class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.index :name
      t.string :email, null: false
      t.string :password_digest
      t.boolean :active, default: true
      t.timestamps null: false
    end

    create_table :user_tracked_achievements, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :achievement, index: true
    end
  end
end
