class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(user_name: params[:user][:user_name])
    # If we call authenticate on an instance of user and pass in a string, it will check if a hashed version of the password would match the user's password digest. If it does, we log the user in...
    if @user 
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)

    else
      flash[:notice] = "Sorry, we can't find a user with that username"
      redirect_to root_path
    end
  end
  def destroy
    session.destroy
    redirect_to root_path
  end
end