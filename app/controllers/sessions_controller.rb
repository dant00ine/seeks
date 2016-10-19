class SessionsController < ApplicationController
  def new
    # reset_session
  end

  def create
    user = User.find_by_email(params[:Email])
    if user && user.authenticate(params[:Password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = ["Invalid credentials.", "Email and password do not match"]
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    puts session[:user_id]
    redirect_to '/sessions/new'
  end
end
