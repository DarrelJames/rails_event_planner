class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new(start_time: Time.now, end_time: Time.now)
    @venue = @event.build_venue
  end

  def show
  end

  def index
    @events = current_user.events
  end

  def create
    @event = Event.create(event_params)

    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find_by_id(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :start_time, :end_time)
  end
end
