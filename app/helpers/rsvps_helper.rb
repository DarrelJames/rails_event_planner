module RsvpsHelper

  def display_instructions(rsvp)
    if flash[:message]
      flash[:message]
    else
    tag.p "You're invited to  #{@rsvp.event.name}! Please RSVP"
    end
  end
end
