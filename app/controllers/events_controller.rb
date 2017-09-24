class EventsController < ApplicationController
  before_action :signed_in, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    user = User.find(session[:current_user_id])
    @event = user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event made"
      redirect_to @event
    else
      flash.now[:alert] = "Incorrect"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attending_users = @event.attendees
    @other_users = User.where.not(id: @attending_users)
  end

  #def update
  #  user = User.find(id)
  #  event = Event.find(id)
  #  user.attended_events << event
  #  redirect_to event_path(event)
  #end

  def index
    @past_events = Event.past.all
    @upcoming_events = Event.upcoming.all
  end

  #def self.past
  #  self.where(["date < ?", DateTime.now])
  #end

  #def self.future
  #  self.where(["date > ?", DateTime.now])
  #end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end

  def signed_in
     if !session[:current_user_id]
       flash[:alert] = "Login to add a post"
       redirect_to login_path
     end
  end
end
