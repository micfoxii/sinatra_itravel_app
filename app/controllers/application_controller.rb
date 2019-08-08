require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    def logged_in?
      !!current_user ##double bang creates a boolean true/false response
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) ## ||= "or equals" calls on user find_by in first instance, then will call on current user
    end

    def validate_signup
      params[:name] != "" && params[:username] != "" && params[:email] != ""
    end
  end
end
