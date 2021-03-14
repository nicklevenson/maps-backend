class ApplicationController < ActionController::API

  def encode_token(user_id)
    JWT.encode(user_id, 'secret')
  end

  def decode_token
    JWT.decode(user_id, 'secret')[0]
  end

  def auth_header
    request.headers ['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
  
end
