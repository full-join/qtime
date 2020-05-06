require 'net/http'
require 'httparty'

class GooglePlaces
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/place/findplacefromtext/json"

   url = base_url + '?' + urllib({
        'input': "grocery store",
        'inputtype': textquery&,
        'fields': photos, formatted_address, name, rating, opening_hours, geometry
        'key': &key=AIzaSyAUmNeJ8L59HymENZT2DvYdnNnwtxon71w,
    })

google_places = GooglePlaces.new

puts url