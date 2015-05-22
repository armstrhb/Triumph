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
end
