class UserAdminController < ApplicationController

	before_action :find_project, only: [:set_user]
	before_action :set_user 

  def index
  	@users = User.all
  end


  private

  def find_project
  	@project = current_user.projects.find(params[:id])
  end

  def set_user
    
  end
end
