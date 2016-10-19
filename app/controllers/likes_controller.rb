class LikesController < ApplicationController
  before_action :require_login
  # before_action :require_correct_user, only: [:destroy]
  def create
    Like.create(user_id: session[:user_id], secret_id: params[:secret_id])
    redirect_to :back
  end
  def destroy
    @like = Like.where(user_id: session[:user_id], secret_id: params[:secret_id]).first.destroy
    redirect_to :back
  end
end
