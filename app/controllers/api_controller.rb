class ApiController < ApplicationController
  #https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/16 (earthquake)
  #https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/12 (valcano)
  #https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/9 (flood)
  def event
    @id = params[:id]
    response = HTTParty.get("https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/#{@id}")
    render json: response["events"]
  end

  def crisis
  end
end
