class LikesController < ApplicationController

  def create
    like = Like.create(marker_id: params[:marker][:id], user_id: params[:currentUserId])
   
    if like
      render json: {message: "liked"}
    end
  end
end
