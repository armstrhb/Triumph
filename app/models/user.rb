class User < ActiveRecord::Base
  has_and_belongs_to_many :groups, :join_table => "user_groups"
  has_and_belongs_to_many :realms, :join_table => "realm_users"
  has_and_belongs_to_many :tracked_achievements, :class_name => 'Achievement', :join_table => "user_tracked_achievements"
  has_many :progresses;
  has_secure_password

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
  validates :active, inclusion: { in: [true, false] }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }

  def total_points
    Progress.joins(:achievement).joins(:user).select("users.id as user_id, sum(achievements.points) as points").where(:completed => true).group("user_id").order("points desc").where(:user_id => id).first.points rescue 0
  end

  def realm_rank(realm)
    Progress.joins(:achievement).joins(:user).select("users.id as user_id, sum(achievements.points) as points, achievements.realm_id as realm_id").where(:completed => true, :achievements => {:realm_id => realm.id}).group("user_id").order("points desc").index{ |item| item.user_id == id } + 1 rescue nil
  end

  def points_for_realm(realm)
    Progress.joins(:achievement).joins(:user).select("users.id as user_id, sum(achievements.points) as points, achievements.realm_id as realm_id").where(:completed => true, :achievements => {:realm_id => realm.id}).group("user_id").order("points desc").where(:user_id => id).first.points rescue 0
  end

  def realm_completions(realm)
    completions = Hash.new

    realm.rarities.order(rareness: :desc).each { |r|
      completions[r] = rarity_completions(r)
    }

    completions
  end

  def completions
    Progress.where(:user_id => id, :completed => true).count
  end

  def rarity_completions(rarity)
    Progress.includes(:achievement).where(:user_id => id, :completed => true, :achievements => {:realm_id => rarity.realm.id, :rarity_id => rarity.id}).length
  end

  def in_realm?(realm)
    realms.each {|r|
      if r.name == realm
        return true
      end
    }

    false
  end

  def current_progress(achievement)
    @progress = progresses.where(:achievement => achievement).last

    if @progress.nil?
      @progress = Progress.new(:achievement => achievement, :user => self)
    end

    @progress
  end

  def times_completed(achievement)
    Progress.where(:achievement => achievement, :user => self, :completed => true).length
  end

  def tracked_achievements_for_realm(realm)
    tracked_achievements.select { |a| a.realm == realm }
  end

  def to_json(options={})
    options[:except] ||= [:password_digest]
    super(options)
  end

  def as_json(options={})
    { # surely there's a better way to do this.
      id: self.id,
      name: self.name,
      email: self.email,
      active: self.active,
      created_at: self.created_at,
      updated_at: self.updated_at
    }
  end

end
