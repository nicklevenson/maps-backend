class SessionsController < ApplicationController

  # def currenet_user
  #   if decoded_token
  #     user_id = decoded_token[0]['user_id']
  #     user = User.find_by(id: user_id)
  #   end
  # end

  # def logged_in?
  #   !!currenet_user
  # end

  # def authorized
  #   render json: {message: "Please Login", status: :unauthorized} unless logged_in?
  # end

  # def authenticate
  #   redirect_to '/auth/google_oauth2'
    
  # end
end
