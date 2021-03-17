class MarkersController < ApplicationController
  before_action :authorized, only: [:create, :destroy]
  def index
    markers = Marker.all
    render json: markers, include: :user
  end

  def create
    marker = Marker.create(marker_params)
    user = marker.user
    if marker.save 
      render json: marker, include: {user: user}
    else
      render json: marker.errors
    end
  end

  def destroy 
    if current_user.id === Marker.find(params[:id]).user_id
      if Marker.find(params[:id]).destroy
        render json: {message: "Destroyed"}
      end
    end
  end


  private

  def marker_params
    params.require(:marker).permit(:title,:lat, :lng, :info, :user_id)
  end
end
