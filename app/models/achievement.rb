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

  def is_complete_for_user(user)
    get_times_user_completed(user) > 0
  end

  def get_times_user_completed(user)
    Progress.where(:user => user.id, :achievement => id, :completed => true).length
  end

  def does_user_have_progress(user, only_incomplete=false)
    prog = get_progress_for_user(user, only_incomplete)
    ! prog.nil? && ((! only_incomplete && prog.length > 0) || (only_incomplete && ! prog.nil?))
  end

  def get_progress_for_user(user, only_incomplete=false)
    if only_incomplete
      progs = Progress.where(:user => user.id, :achievement => id, :completed => false)
      if ! progs.nil?
        progs[0]
      else
        nil
      end
    else
      Progress.where(:user => user.id, :achievement => id)
    end
  end

  def get_recent_completed_progress(limit=5)
    Progress.where(:achievement => id, :completed => true).order(complete_date: :desc).limit(limit)
  end
end
