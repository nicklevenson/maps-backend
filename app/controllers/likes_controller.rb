class LikesController < ApplicationController

  def create
    like = Like.find_or_create_by(marker_id: params[:marker][:id], user_id: params[:currentUserId])
   
    if like
      render json: {message: "liked"}
    end
  end

  def goodbye
  
    Like.find_by(marker_id: params[:marker][:id], user_id: params[:currentUserId]).destroy
    render json: {message: "Removed"}
  end
end
