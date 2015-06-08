class Realm < ActiveRecord::Base
  has_many :achievements, :foreign_key => "realm_id"
  has_many :categories, :foreign_key => "realm_id"
  has_many :rarities, :foreign_key => "realm_id"
  has_and_belongs_to_many :users, :join_table => "realm_users"
  belongs_to :group, :foreign_key => "group_id"
  belongs_to :icon, :foreign_key => "icon_id"

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :active, inclusion: { in: [true, false] }

  def total_points_earned
    @points = 0

    completed_achievements.each do |a|
      @points += a.achievement.points
    end

    @points
  end

  def new_users(limit=5, since=7)
    users.select {|user| user.created_at >= Date.today.days_ago(since) }[0..limit]
  end

  def completed_achievements
    Progress.includes(:achievement).where(:achievements => {:realm_id => id}, :completed => true)
  end
end
