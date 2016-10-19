class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @secrets = Secret.all
  end

  def new
  end

  def show
  end

  def create
    @secret = Secret.create(user_id: session[:user_id], content: params[:content])
    if @secret.valid?
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = Secret.errors.full_messages
    end
  end

  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to :back
  end
end
