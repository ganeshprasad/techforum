# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_logged_in?
    session[:user_id]
  end
  
  def session_time_left current_user
    time_left = time_ago_in_words(current_user.online_at + 5.minutes)
    logger.info(time_left.inspect)
    logger.info(time_left.class)
    return "Your session expires in: '#{time_left}'"   # if time_left < "1 minute"
    return "You have been logged out, Please login again."
  end 
  
  def current_controller
    request.path_parameters['controller']
  end  
  
  def current_action
    request.path_parameters['action']
  end
  
  def tab(name)
    if name == current_controller
      'current_tab'
    elsif name == "forums" && %w(categories topics posts).include?(current_controller)
      'current_tab'
    elsif name == "users" && ((current_controller == "users"))
      'current_tab'
    end
  end
end
