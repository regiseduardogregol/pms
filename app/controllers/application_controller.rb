class ApplicationController < ActionController::Base
  protect_from_forgery

  #private 

  #def current_user
  #	@current_user ||= session[:user]
  #end

  #helper_method :current_user

  #def authorize
  #	redirect_to login_url, notice: "Você deve estar logado." if current_user.nil?
  #end
end
