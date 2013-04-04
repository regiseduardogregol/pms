class SessionsController < ApplicationController
	layout "auth"
	
	  def new
	  end

	  def create
	  		auth = LDAP.authenticate(params[:username], params[:password])
			if auth
				session[:user] = auth
				redirect_to root_url
			else
				flash.now.notice = "Sem permissão."
				render "new"
			end
	  end

	  def destroy
	  		session[:user] = nil
			redirect_to login_path
	  end
end
