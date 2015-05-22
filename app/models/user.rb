class User < ActiveRecord::Base
  has_and_belongs_to_many :groups, :join_table => "user_groups"
  has_and_belongs_to_many :realms, :join_table => "realm_users"
  has_many :progresses;

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :active, inclusion: { in: [true, false] }
end
