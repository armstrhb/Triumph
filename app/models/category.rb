class Category < ActiveRecord::Base
  has_many :achievements, :foreign_key => "category_id"
  belongs_to :realm, :foreign_key => "realm_id"
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
end
