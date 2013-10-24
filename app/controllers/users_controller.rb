class UsersController < ApplicationController
   layout 'application'
   before_filter :not_logged_in_required, :only => [:new, :create]
   
   before_filter :login_required, :only => [:show, :edit, :update]
   before_filter :check_super_user_role, :only => [:index, :destroy, :enable, :disable, :force_activate, :disable_and_reset, :force_resend_activaton, :stats]
   helper :sort
   include SortHelper

   def stats
     sort_init "total_count"
     sort_update
  
     @html_title = "Users Stats"

     the_sql = "select user_id, username, COUNT(user_id) as total_count,
      COUNT(case when auditable_type='Gcp' then 1 end) as gcp_count,
      COUNT(case when auditable_type='Map' or auditable_type='Mapscan' then 1 end) as map_count,
      COUNT(case when action='update' and auditable_type='Gcp' then 1 end) as gcp_update_count,
      COUNT(case when action='create' and auditable_type='Gcp' then 1 end) as gcp_create_count,
      COUNT(case when action='destroy' and auditable_type='Gcp' then 1 end) as gcp_destroy_count
      from audits group by user_id, username ORDER BY #{sort_clause}"

     @users_activity = Activity.paginate_by_sql(the_sql,
                        :page => params[:page],
                        :per_page => 30)
   end


   def index
      @html_title = "Users"
      sort_init 'login'
      sort_update
      @query = params[:query]
      @field = %w(login email).detect{|f| f == (params[:field])}
      if @query && @query.strip.length > 0 && @field
        conditions = ["#{@field}  ~* ?", '(:punct:|^|)'+@query+'([^A-z]|$)']
      else
        conditions = nil
      end
      @users = User.paginate(:page=> params[:page],
                            :per_page => 30,
                            :order => sort_clause,
                            :conditions => conditions
                            )
   end

   def index_for_group
      @group = Group.find(params[:group_id])
      @html_title = "Users in Group " + @group.id.to_s
      sort_init 'login'
      sort_update
      @query = params[:query]
      @field = %w(login email).detect{|f| f == (params[:field])}
      if @query && @query.strip.length > 0 && @field
        conditions = ["#{@field}  ~* ?", '(:punct:|^|)'+@query+'([^A-z]|$)']
      else
        conditions = nil
      end
      @users = @group.users.paginate(:page=> params[:page],
                            :per_page => 30,
                            :order => sort_clause,
                            :conditions => conditions
                            )
      render :action => 'index'
   end
  
   def show
      @user = User.find(params[:id]) || current_user
      @html_title = "Showing User "+ @user.login.capitalize
      @mymaps = @user.maps.paginate(:page => params[:page],:per_page => 8, :order => "updated_at DESC")
      @current_user_maps = current_user.maps
      respond_to do | format |
        format.html {}
        format.js {}
        format.json {render :json => {:stat => "ok",:items => @user.to_a}.to_json(:only =>[:login, :created_at, :stat, :items, :enabled ])  }
   end

   end

   def edit
      @html_title = "Edit User Setttings"
      @user = current_user
   end

   def update
      @user = User.find(current_user)
      if @user.update_attributes(params[:user])
         flash[:notice] = "User updated"
         redirect_to :action => 'show', :id => current_user
      else
         render :action => 'edit'
      end
   end

   def destroy
      @user = User.find(params[:id])
      unless @user.has_role?("administrator") ||  @user.has_role?("super user")
        if @user.destroy
          flash[:notice] = "User successfully deleted"
        else
          flash[:error] = "User could not be deleted"
        end
      else
        flash[:error] = "Admins cannot be destroyed"
      end
      redirect_to :action => 'index'
   end

   def disable_and_reset
     @user = User.find(params[:id])
     unless @user.has_role?("administrator") ||  @user.has_role?("super user")
       #disable
      if @user.update_attribute(:enabled, false)
         #@user.forgot_password
         #@user.save  #user_observer sends password now
         flash[:notice] = "User disabled"
       else
        flash[:error] = "Sorry, there was a problem disbaling this user"
       end
     else
       flash[:error] = "Admins cannot be disabled and reset, sorry"
     end
     redirect_to :action => 'show'
   end

   def disable
      @user = User.find(params[:id])
      if @user.update_attribute(:enabled, false)
         flash[:notice] = "User disabled"
      else
         flash[:error] = "There was a problem disabling this user."
      end
      redirect_to :action => 'index'
   end

   def enable
      @user = User.find(params[:id])
      if @user.update_attribute(:enabled, true)
         flash[:notice] = "User enabled"
      else
         flash[:error] = "There was a problem enabling this user."
      end
      redirect_to :action => 'index'
   end
   
end
