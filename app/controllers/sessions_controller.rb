class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:session][:id])
    if user
      flash[:success] = "Signed in"
      session[:current_user_id] = user.id
      redirect_to user
    else
      flash[:alert] = "Not a correct ID"
      render 'new'
    end
  end

  def destroy
    if session[:current_user_id]
      session[:current_user_id] = nil
      flash[:success] = "Successfully signed out."
      redirect_to login_path
    else
      flash.now[:alert] = "You are already signed out"
      render 'new'
    end
  end
end
