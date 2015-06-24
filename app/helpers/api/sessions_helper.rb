module Api::SessionsHelper
  def api_current_user
    user_session = ApiSessionBank.instance.user_from_token(request.headers['X-Triumph-Token'])
    if user_session.present?
      @api_current_user ||= User.where(:name => user_session[:name]).first
    else
      @api_current_user = nil
    end
  end

  def api_logged_in?
    !api_current_user.nil?
  end
end
