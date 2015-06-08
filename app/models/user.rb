class User < ActiveRecord::Base
  has_and_belongs_to_many :groups, :join_table => "user_groups"
  has_and_belongs_to_many :realms, :join_table => "realm_users"
  has_many :progresses;
  has_secure_password

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
  validates :active, inclusion: { in: [true, false] }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }

  def total_points
    points = 0
    progresses.each { |p|
      if p.completed == true
        points += p.achievement.points
      end
    }

    points
  end

  def points_for_realm(realm)
    points = 0

    progresses.each { |p|
      if p.realm.id == realm.id && p.completed == true
        points += p.achievement.points
      end
    }

    points
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
end
