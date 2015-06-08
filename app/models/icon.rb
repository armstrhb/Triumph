class Icon < ActiveRecord::Base
  has_many :rarities, :foreign_key => "icon_id"
  has_many :categories, :foreign_key => "icon_id"
  validates :name, presence: true, length: { minimum: 1 }, uniqueness: true
end
