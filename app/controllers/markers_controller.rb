class MarkersController < ApplicationController
  def index
    markers = Marker.all
    render json: markers
  end

  def create
    marker_params
  end


  private

  def marker_params
    byebug
  end
end
