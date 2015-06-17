class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :admin?, :sys_config, :realm_admin?
  rescue_from NotAuthorizedError, with: :permission_denied

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

  def authorize_admin
    raise NotAuthorizedError unless admin?
  end

  def authorize_realm_admin(realm)
    raise NotAuthorizedError unless realm_admin?(realm)
  end

  def authorize_group_member(group)
    raise NotAuthorizedError unless group.users.include?(current_user) || group.admin == current_user || admin?
  end

  def authorize_group_admin(group)
    raise NotAuthorizedError unless group.admin == current_user || admin?
  end

  private
    def permission_denied
      head 403
    end
end
