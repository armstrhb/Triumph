module Api::SessionsHelper
  def api_current_user
    user_session = ApiSessionBank.instance.user_from_token(api_current_token)
    if user_session.present?
      @api_current_user ||= User.where(:name => user_session[:name]).first
    else
      @api_current_user = nil
    end
  end

  def api_logged_in?
    !api_current_user.nil?
  end

  def api_authorized?
    api_logged_in? && ApiSessionBank.instance.active?(api_current_user.name, api_current_token)
  end

  def api_current_token
    request.headers['X-Triumph-Token']
  end

  def bump_api_session
    ApiSessionBank.instance.bump(api_current_token)
  end
end
