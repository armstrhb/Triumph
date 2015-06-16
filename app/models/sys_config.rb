class SysConfig < ActiveRecord::Base
  validates :key, presence: true, uniqueness: true

  def self.get(key)
    SysConfig.where(:key => key).first.value
  end
end
