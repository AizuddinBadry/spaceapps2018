namespace :disaster do
  task :all => :environment do
    response = HTTParty.get("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson")
    response["features"].each do |val|
      @disaster = Disaster.find_by_ids(val["properties"]["ids"])
      if !@disaster.present?
        @disaster = Disaster.create!(place: val["properties"]["place"], time: val["properties"]["time"], alert: val["properties"]["alert"], tsunami: val["properties"]["tsunami"],
                                     mag: val["properties"]["mag"], types: val["properties"]["type"], title: val["properties"]["title"], ids: val["properties"]["ids"],
                                     lat: val["geometry"]["coordinates"][0], lng: val["geometry"]["coordinates"][1])
      end
    end
  end

  task :test => :environment do
    @disaster = Disaster.all
    @disaster.each do |d|
       @distance = Geocoder::Calculations.distance_between([51.7651, 19.45687], [d.lat, d.lng], units: :km)
       puts @distance
    end
  end
end
