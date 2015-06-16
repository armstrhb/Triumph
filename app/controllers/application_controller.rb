class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :admin?, :sys_config, :realm_admin?

  def admin?
    false if !logged_in?

    admin_group = Group.find(sys_config('triumph.admin.group'))
    admin_group.users.include?(current_user)
  end

  def sys_config(key)
    SysConfig.where(:key => key).first.value
  end

  def realm_admin?(realm)
    false if !logged_in?
    admin? || realm.group.users.include?(current_user)
  end
end
