module ApplicationHelper

  def logout
    current_user.ensure_session_token
    current_user.save!
    session[:token] = nil
  end

  def login!(user)
    session[:token] = user.session_token
    @current_user = user
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def auth_token_helper
    "<input type='hidden'
      name='authenticity_token'
      value='#{form_authenticity_token}'
    ".html_safe
  end

end
