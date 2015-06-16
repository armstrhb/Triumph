class CreateSysConfigs < ActiveRecord::Migration
  def change
    create_table :sys_configs do |t|
      t.string :key, :null => false, :index => true
      t.string :value
      t.timestamps null: false
    end
  end
end
