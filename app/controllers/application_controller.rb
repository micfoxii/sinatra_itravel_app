require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
    end
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

    def validate_destinations
      #exclude state for nil values
      params[:city] != "" && params[:state] !="" && params[:country] != "" && params[:trip_description] && params[:slept_at] != "" && params[:slept_details] != "" && params[:restaurant_fav] != "" && params[:restaurant_details] != "" && params[:attraction_fav] != "" && params[:attraction_details] != "" && params[:recommendations]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "Please login to view page."
        redirect '/'
      end
    end

    def authorized_to_edit?(destination)
      destination.user == current_user
    end
  end
end
