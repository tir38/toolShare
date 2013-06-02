module SessionsHelper


  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user     # what is "self" here? Is it a session?
  end

  def current_user=(user) # assignment method
    @current_user = user
  end

  def current_user   # retrieve method
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) # get user by finding token stored in cookie
    # ||=  is the 'or equals' operator
  end

  def signed_in?
    !current_user.nil? # if current user is not nil then user is signed in
  end

  def sign_out(user)
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
