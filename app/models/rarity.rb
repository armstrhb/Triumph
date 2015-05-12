class Rarity < ActiveRecord::Base
  has_many :achievements, :foreign_key => "rarity_id"
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
end
