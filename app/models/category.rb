class Category < ActiveRecord::Base
  has_many :achievements, :foreign_key => "category_id"
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
end
