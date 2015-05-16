class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.belongs_to :achievement, index: true
      t.belongs_to :user, index: true
      t.integer :ticks, :default => 0
      t.boolean :completed, :default => false
      t.datetime :complete_date, :null => true
      t.timestamps null: false
    end
  end
end
