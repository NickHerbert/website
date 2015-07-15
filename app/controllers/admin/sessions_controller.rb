class Admin::SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:email => auth['info']['email']).first
    if user
      if user.email.split("@").last == "gmail.com"
        if user.uid.blank? || user.provider.blank?
          user = User.update_with_omniauth_info(auth)
        end

        session[:user_id] = user.uid
        flash[:notice] = "Signed in!"
      else
        flash[:error] = "Authenticaton error: Only Gmail email addresses are accepted."
      end
    else
      flash[:error] = "Authenticaton error: You must register first"
    end
    redirect_to root_path
  end

  def new
    redirect_to '/auth/google'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_path, :alert => "Authentication error: #{params[:message].humanize}. Be sure to use proper credentials"
  end

end