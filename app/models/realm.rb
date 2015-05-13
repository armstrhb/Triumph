class Realm < ActiveRecord::Base
  has_many :achievements, :foreign_key => "realm_id"
  has_many :categories, :foreign_key => "realm_id"
  has_many :rarities, :foreign_key => "realm_id"
  has_and_belongs_to_many :users, :join_table => "realm_users"
  belongs_to :group, :foreign_key => "group_id"

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :active, inclusion: { in: [true, false] }
end
