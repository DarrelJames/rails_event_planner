User.destroy_all

Event.destroy_all
Venue.destroy_all
Guest.destroy_all
Faker::UniqueGenerator.clear

User.create(email: "user1@email.com", password: "password")
User.create(email: "user2@email.com", password: "password")

puts "Created #{User.count} Users"

10.times do
  Venue.create(name: Faker::WorldCup.unique.stadium)
end
puts "Created #{Venue.count} Venues"


10.times do
  user_id_num = Faker::Number.between(from: User.first.id, to: User.last.id)
  venue_id_num = Faker::Number.between(from: Venue.first.id, to: Venue.last.id)
  Event.create(user_id: user_id_num, venue_id: venue_id_num, name: Faker::Educator.unique.course_name, date: Faker::Date.forward(days: 50), start_time: Faker::Time.forward(days: 23, period: :morning) , end_time: Faker::Time.forward(days: 23, period: :morning))
end

puts "Created #{Event.count} Events"

#Create Guest


User.all.each do |user|
  num_guest = Faker::Number.number(digits: 2)

  num_guest.times do

    num_elements = Faker::Number.between(from: 1, to: 5)
    array = []
    num_elements.times do
      array << Faker::Number.between(from: Event.first.id, to: Event.last.id)
    end

    user.guests.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.zip_code, event_ids: array)
  end

  puts "Create #{user.guests.count} guests for User#{user.id}"
end

Guest.all.each do |guest|
  guest.rsvps.each do |rsvp|
    
    rsvp.response = Faker::Boolean.boolean
    rsvp.save
  end
end
