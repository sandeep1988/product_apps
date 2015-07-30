class WelcomeController < ApplicationController
     respond_to :html, :js
  def index
  	@users = User.all
  end
end