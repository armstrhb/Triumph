class User < ActiveRecord::Base
  has_and_belongs_to_many :groups, :join_table => "user_groups"
  validates :name, presence: true, length: { minimum: 3 }
  validates :active, inclusion: { in: [true, false] }
end
