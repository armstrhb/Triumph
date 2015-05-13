class Rarity < ActiveRecord::Base
  has_many :achievements, :foreign_key => "rarity_id"
  belongs_to :realm, :foreign_key => "realm_id"
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
end
