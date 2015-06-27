class Group < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "user_groups", :uniq => true
  has_many :realms, :foreign_key => "group_id"
  belongs_to :admin, :class_name => 'User'
  validates :name, presence: true, length: { minimum: 3 }
  validates_uniqueness_of :name
end
