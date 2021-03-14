class SessionsController < ApplicationController
  def authenticate
    redirect_to '/auth/google_oauth2'
    
  end
end
