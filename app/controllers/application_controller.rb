class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :check_site_access
  helper_method :check_login

  #OMNI-AUTH helpers
  def current_user
    @current_user ||= User.where("uid = ?", session[:user_id]).first if session[:user_id]
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def authenticate_user!
    if !current_user
      redirect_to root_path, :alert => 'You need to sign in for access to that page.'
    end
  end

  def check_site_access
    unless current_user.role == "super_admin"
      unless @site.nil?
        unless @site.site_memberships.find_by_user_id(current_user.id)
          redirect_to admin_sites_path, :alert => "You dont have access to #{@site.name}. Please contact your Administrator."
        end
      end
    end
    return true
  end
  def check_login
    #flash[:notice] = "Please Login." unless current_user

    redirect_to signin_path unless current_user
  end

end
