class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(user_name: params[:user][:user_name])
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