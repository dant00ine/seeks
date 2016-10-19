class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
    @secrets = @user.secrets
  end
  def new
    @user = User.new
    render 'new'
  end
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end
  def edit
    @user = User.find(params[:id])
    render 'edit'
  end
  def update
    @user = User.update(params[:id], user_params)
    redirect_to "/users/#{@user.id}"
  end
  def destroy
    User.destroy(params[:id])
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end
  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
