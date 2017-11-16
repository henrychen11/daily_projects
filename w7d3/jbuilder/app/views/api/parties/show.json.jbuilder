json.extract! @party, :name, :location

json.guests @party.guests do |guest|
  json.name guest.name
    # guest.gifts do |gift|
    #   json.gift gift.title
    # end
  json.set! :gifts, guest.gifts do |gift|
    json.extract! gift, :title
  end

end
