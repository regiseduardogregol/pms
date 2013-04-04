class HomeController < ApplicationController
	before_filter :authorize
	
	  def index
	  	@servers = Server.all
	  end
end
