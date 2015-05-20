class Achievement < ActiveRecord::Base
  belongs_to :rarity, :foreign_key => "rarity_id"
  belongs_to :category, :foreign_key => "category_id"
  belongs_to :realm, :foreign_key => "realm_id"

  validates :title, presence: true, length: { minimum: 3 }
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :active_start, presence: true
  validates :active_end, presence: true
  validates :repeatable, inclusion: { in: [true, false] }
  validates :required_ticks, numericality: {only_integer: true, greater_than: 0 }
  validates :description, presence: true, length: { minimum: 3 }

  def get_completed_users
    User.joins('inner join progresses on users.id = progresses.user_id').where(:progresses => {:achievement_id => id, :completed => true}).uniq
  end
end
