class UsersController < ApplicationController
  before_action :authorized, only: :show
  def create
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.image = auth['info']['image']
      u.username = auth['info']['name']
      u.email = auth['info']['email']
    end
    if user 
      token = encode_token(user_id: user.id)
      redirect_to('http://localhost:3001/login' + "?token=#{token}" + "?&id=#{user.id}")
    end
  end

  def show
   
    user = User.find(params[:id])
    render json: user, include: :markers
  end

  private 
  def auth
    request.env['omniauth.auth']
  end 
end
