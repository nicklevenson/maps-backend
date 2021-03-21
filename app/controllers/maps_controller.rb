class MapsController < ApplicationController
  before_action :authorized, only: [:create, :update, :destroy]
  def index
    maps = Map.all
    render json: maps, include: [:users, :markers => {include: :user}]
  end

  def create
    map = Map.new(map_params)
    user = User.find(params[:map][:user_id])
  
    if params[:map][:collaborator]
      collaborator = User.find(params[:map][:collaborator])
    end

    if collaborator
      user.maps << map
      collaborator.maps << map
      # map.users << [user, collaborator]
    else
      user.maps << map
    end
  
    if map.save 
      render json: map, include: [:users, :markers => {include: :user}]
    else
      render json: {error: map.errors.full_messages}
    end
  end

  def update
    map = Map.find(params[:map][:id])
    map.update(map_params)
    errors = []
    if params[:map][:collaborator]
      collaborator = User.find(params[:map][:collaborator])
    end

    if collaborator
      if !collaborator.maps.include?(map)
        collaborator.maps << map
      else
        errors << "Already added this collaborator"
      end
    end
       
    if map.save && errors.empty?
      render json: map, include: [:users, :markers => {include: :user}]
    else
      render json: {error: [errors[0], map.errors.full_messages]}
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
