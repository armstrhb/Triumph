require 'singleton'

class ApiSessionBank
  include Singleton
  attr_accessor :active_sessions, :inactivity_timeout

  def initialize(timeout=180)
    @active_sessions = []
    @inactivity_timeout = timeout
  end

  def add(user)
    scrub
    new_entry = {:name => user.name, :token => generate_token, :last_used => Time.now.to_i}
    @active_sessions << new_entry

    new_entry
  end

  def active?(user, token)
    scrub
    user_entry = user_from_name(user)

    user_entry.present? && user_entry[:token] == token && within_timeout(user_entry)
  end

  def user_from_token(token)
    result = @active_sessions.find{|a| a[:token] == token}
  end

  def user_from_name(name)
    @active_sessions.find{|a| a[:name] == name}
  end

  def scrub
    @active_sessions = @active_sessions.select { |a| within_timeout(a) }
  end

  private
    def generate_token
      SecureRandom.hex(20)
    end

    def within_timeout(user)
      user[:last_used] + @inactivity_timeout > Time.now.to_i
    end
end
