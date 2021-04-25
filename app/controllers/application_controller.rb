class ApplicationController < ActionController::API
  
  def encode_token(user_id)
    payload = {userid: user_id}
    # JWT.encode(user_id, Rails.application.credentials.jwt[:secret], 'HS256')
    JWT.encode payload, "balh", 'HS256'
  end

  def decode_token(token)
    # JWT.decode(token, Rails.application.credentials.jwt[:secret])[0]

    JWT.decode token, "balh", true, { algorithm: 'HS256' }
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        # JWT.decode(token, Rails.application.credentials.jwt[:secret], true, algorithm: 'HS256')

      JWT.decode token, "balh", true, { algorithm: 'HS256' }
      rescue JWT::DecodeError
        nil
      end
    end
  end
  
  def current_user
    if !decoded_token.empty?
      # byebug
      user_id = decoded_token[0]['userid']['user_id']
      user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    # byebug
    render json: {message: "Please Login", status: :unauthorized} unless logged_in? && current_user.id == params[:id].to_i || params[:user_id].to_i
  end
  
  def authenticate
    redirect_to '/auth/google_oauth2'
    
  end
end
