class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  #https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/16 (earthquake)
  #https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/12 (valcano)
  #https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/9 (flood)
  def event
    @id = params[:id]
    response = HTTParty.get("https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/#{@id}")
    render json: response["events"]
  end

  def crisis
    @disaster = Disaster.where(types: params[:types]).all
    @count = 0
    @disaster.each do |d|
      @distance = Geocoder::Calculations.distance_between([d.lat, d.lng], [params[:lat], params[:lng]], units: :km)
      if (@distance / 100) < 40
        @count = @count + 1
      end
    end

    render json: {type: params[:types], count: @count}
  end
end
