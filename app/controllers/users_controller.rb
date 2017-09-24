class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Private Event"
      redirect_to @user
    else
      flash.now[:alert] = "Some areas are incorrect. Please try again"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    date = DateTime.now
    @upcoming_events = @user.attended_events.where(["date > ?", date])
    @prev_events = @user.attended_events.where(["date < ?", date])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
