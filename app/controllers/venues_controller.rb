class VenuesController < ApplicationController
  def show
    @event = Event.find_by_id(params[:event_id])
    @venue = Venue.find_by_id(params[:id])
    render 'show', layout: 'special'
  end
end
