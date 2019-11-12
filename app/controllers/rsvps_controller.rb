class RsvpsController < ApplicationController

  def index
    @rsvp = Rsvp.find_by(guest_id: session[:guest_id], event_id: params[:event_id])
  end

  def update
    @rsvp = Rsvp.find_by(guest_id: session[:guest_id], event_id: params[:event_id])
    @rsvp.update(rsvp_params)
    redirect_to event_rsvps_path
  end

  def create
    @event = Event.find_by_id(params[:event_id])
    @guest = @event.guests.find_by(first_name: params[:first_name], last_name: params[:last_name])

    if @guest

      session[:guest_id] = @guest.id
      @rsvp = Rsvp.find_by(guest_id: @guest.id, event_id: @event.id)

      redirect_to event_rsvps_path
    else
      flash[:error] = "Sorry, couldn't find your name on the guestlist."

      redirect_to event_rsvps_path
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:response)
  end
end
