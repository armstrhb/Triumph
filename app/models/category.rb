class Category < ActiveRecord::Base
  has_many :achievements, :foreign_key => "category_id"
  belongs_to :realm, :foreign_key => "realm_id"
  belongs_to :icon, :foreign_key => "icon_id"
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true, length: { in: 5..30 }
end
