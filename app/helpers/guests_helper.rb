module GuestsHelper

  def display_guest_header(event)
    if event
      tag.h1 "Guests for #{event.name}"
    else
      tag.h1 "All Guests"
    end
  end
end
