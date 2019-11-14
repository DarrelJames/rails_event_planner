class RsvpsController < ApplicationController
  before_action :set_rsvp, only: [:index, :update]
  def index
     @event = Event.find_by_id(params[:event_id])
      render 'index', layout: 'special'



  end

  def update
    if @rsvp.update(rsvp_params)
      flash[:message] = "Thank you for your response!"
      redirect_to event_rsvps_path
    else
      flash[:message] = "Something went wrong"
      redirect_to event_rsvps_path
    end
  end

  def create
    @event = Event.find_by_id(params[:event_id])
    @guest = @event.guests.full_name_nocase(params[:first_name], params[:last_name])

    if @guest.present?

      session[:guest_id] = @guest.id
      @rsvp = set_rsvp

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

  def set_rsvp
    @rsvp = Rsvp.find_by(guest_id: session[:guest_id], event_id: params[:event_id])
  end
end
