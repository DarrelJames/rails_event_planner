class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def new
    @event = Event.new(start_time: Time.now, end_time: Time.now)
    @venue = @event.build_venue
  end

  def show
    render 'show', layout: 'special'
  end

  def index
    if params[:event]
      @events = Event.by_name(params[:event])
    else
      @events = current_user.events
    end
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find_by_id(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :start_time, :end_time, venue_attributes: [:name, :street, :city, :state, :zip_code])
  end
end
