class MapsController < ApplicationController

  def index
    maps = Map.publicMaps
    render json: maps, include: [:markers => {include: :user}]
  end
end
