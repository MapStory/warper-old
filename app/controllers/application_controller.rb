# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  filter_parameter_logging :password
  include AuthenticatedSystem
  audit Map, Gcp
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '02fd3a68fbbf6bb592746ba9dd1e79d6'




layout 'application'
   
	# Debugging method to check for a MapStory Cookie
	# Call with a before_filter.
	def check_cookie
		Rails.logger.info "Checking for MapStory cookie"

		if cookies[:msid]
			Rails.logger.info "-- We have a msid cookie"
			decoded_value = MapstoryCookie.decode(cookies[:msid])
			Rails.logger.info "-- Our decoded value is: " + decoded_value.inspect
			return decoded_value
		else
			Rails.logger.info "-- No cookie detected"
			return false
		end
	end

end
