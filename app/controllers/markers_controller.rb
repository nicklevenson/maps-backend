class MarkersController < ApplicationController
  def index
    markers = Marker.all
    render json: markers
  end

  def create
    marker = Marker.new( marker_params)
    marker.user_id = 1

    if marker.save 
      render json: marker
    else
      render json: marker.errors
    end
  end


  private

  def marker_params
    params.require(:marker).permit(:title,:lat, :lng, :info)
  end
end
