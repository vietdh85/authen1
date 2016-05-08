class UsersController < ApplicationController

  before_action :require_user, only: [:new, :create]
  before_action :require_editor, only: [:new]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
