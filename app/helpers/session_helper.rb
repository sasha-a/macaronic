helpers do

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @_cached_user ||= User.find(session[:user_id]) if logged_in?
  end

  def authorized!
    redirect '/login' unless logged_in?
  end

  def your_own_stuff(obj)
    obj.user_id == current_user.id
  end

end
