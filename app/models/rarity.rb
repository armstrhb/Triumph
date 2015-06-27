class Rarity < ActiveRecord::Base
  has_many :achievements, :foreign_key => "rarity_id"
  belongs_to :realm, :foreign_key => "realm_id"
  belongs_to :icon, :foreign_key => "icon_id"
  validates :name, presence: true, length: { minimum: 3 }
  validates_uniqueness_of :name, scope: :realm_id
  validates :description, presence: true, length: { in: 5..45 }
end
