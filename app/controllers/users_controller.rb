require 'pry'

class UsersController < ApplicationController
	def new
		@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end


  def create
  	redirect_to user
  end

  def destroy
    redirect_to root_path
  end
end
