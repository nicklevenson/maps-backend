class MapsController < ApplicationController
  before_action :authorized, only: :create
  def index
    maps = Map.all
    render json: maps, include: [:users, :markers => {include: :user}]
  end

  def create
    map = Map.new(map_params)
    user = User.find(params[:map][:user_id])
    map.users << user
    if map.save 
      render json: map, include: [:users, :markers => {include: :user}]
    else
      render json: {error: map.errors.full_messages}
    end
  end

  def update
    map = Map.find(params[:map][:id])
    map.update(map_params)
    if map.save 
      render json: map, include: [:users, :markers => {include: :user}]
    end
  end

  def destroy
    map = Map.find(params[:id])
    if map.users.first === current_user
      map.destroy()
      render json: {message: "Map Deleted"}
    end

  end

  private 

  def map_params
    params.require(:map).permit(:title, :description, :public)
  end
end
