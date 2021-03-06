class Progress < ActiveRecord::Base
  belongs_to :achievement, :foreign_key => "achievement_id"
  belongs_to :user, :foreign_key => "user_id"
  has_one :realm, :through => :achievement

  validates :achievement, presence: true
  validates :user, presence: true
  validates :ticks, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def completed?
    ticks >= achievement.required_ticks
  end

  def percent_complete
    ticks / achievement.required_ticks.to_f * 100
  end

  def remaining
    achievement.required_ticks - ticks
  end

  def grant
    if ! completed?
      if id.nil?
        self.save
      end

      update(:ticks => achievement.required_ticks, :completed => true, :complete_date => Date.today)
    end
  end

  def forfeit
    return if id.nil?
    update(:ticks => 0, :completed => false, :complete_date => :nil)
  end
end
