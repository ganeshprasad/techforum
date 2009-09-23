# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_logged_in?
    session[:user_id]
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
