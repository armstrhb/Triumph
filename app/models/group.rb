class Group < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "user_groups"
  has_many :realms, :foreign_key => "group_id"
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
end
