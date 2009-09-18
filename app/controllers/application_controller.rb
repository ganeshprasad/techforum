# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

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
end
