class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :set_locale
  
  #protected

  #def set_locale
  #  I18n.locale = params[:locale] if params.include?('locale')
  #end

  #def default_url_options(options={})	options.merge!({:locale => I18n.locale}) end

  

  #def current_user
  #	@current_user ||= session[:user]
  #end

  #helper_method :current_user

  #def authorize
  #	redirect_to login_url, notice: "Você deve estar logado." if current_user.nil?
  #end
end
