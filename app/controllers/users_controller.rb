class UsersController < ApplicationController
  def create
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.image = auth['info']['image']
      u.username = auth['info']['name']
      u.email = auth['info']['email']
    end
    if user 

    end
  end

  private 
  def auth
    request.env['omniauth.auth']
  end 
end
