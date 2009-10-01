# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
#  MAX_SESSION_TIME = 3 * 3
#
#before_filter :prepare_session
#
#def prepare_session
#
#   if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
#      # Session has expired. Clear the current session.
#      reset_session
#   end
#
#   # Assign a new expiry time, whether the session has expired or not.
#   session[:expiry_time] = MAX_SESSION_TIME.seconds.from_now
#   return true
#end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  helper_method :is_admin?
  def is_admin? 
    if logged_in? && current_user.login == "admin"
      true
    else
      false
    end
  end
    
  def admin_required
    is_admin? || admin_denied
  end
    
  def admin_denied
    respond_to do |format|
      format.html do
        store_location
        flash[:notice] = 'You must be an admin to do that.'
        redirect_to forums_path
      end
    end
  end
    
  def say_when
    render :text => "<p>The time is <b>" + DateTime.now.to_s + "</b></p>"
  end

end
