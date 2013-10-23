# This controller handles the login/logout function of the site.
class SessionsController < ApplicationController
   layout 'application'
   before_filter :login_required, :only => :destroy
  # before_filter :not_logged_in_required, :only => [ :create]
 before_filter :not_logged_in_required, :only => [:new, :create]
   # render new.rhtml
   def new
     @html_title = "Login"
     if  (["Rectify_tab", "Crop_tab", "Align_tab", "Export_tab","Activity_tab", "Comments_tab"].include?(params[:back].to_s) && params[:mapid])
       session[:return_to] = map_path(:id => params[:mapid], :anchor => params[:back])
   end
   end

   def create
      password_authentication(params[:email], params[:password])
   end

   def destroy
      self.current_user.forget_me if logged_in?
      cookies.delete :auth_token
      # Also remove the mapstory cookie, user will have to re-log at mapstory
      # to gain access again.
      cookies.delete :msid
      reset_session
      flash[:notice] = "You have been logged out."
      redirect_to login_path
   end

   private

   def failed_login(message, item="")
      flash.now[:error] = message
      flash.now[:error_item] = item
      render :action => 'new'
   end

   def successful_login
      flash.now[:notice] = "Logged in successfully"
      #logger.info "successful login = " + session[:return_to]
      return_to = session[:return_to]
      if return_to.nil?
         redirect_to user_path(self.current_user)
      else
         redirect_to return_to
      end
   end

end
