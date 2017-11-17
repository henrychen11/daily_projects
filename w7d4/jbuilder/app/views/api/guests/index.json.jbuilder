# json.array! @guests do |guest|
#   json.name guest.name
#   json.age guest.age
#   json.favorite_color guest.favorite_color
# end



json.array! @guests.each do |guest|
  if guest.age.between?(40, 50)
    json.partial! 'guest', guest: guest
  end
end
