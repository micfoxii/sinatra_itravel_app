class DestinationsController < ApplicationController

    get '/destinations/new' do
        if logged_in?
        erb:'/destinations/new'
        else
            redirect '/'
        end
    end

    post '/destinations' do
        #if logged in values not nil save
        if validate_destinations
            @destination = Destination.create(
                city: params[:city], 
                state: params[:state],
                country: params[:country],
                trip_description: params[:trip_description],
                slept_at: params[:slept_at],
                slept_details: params[:slept_details],
                restaurant_fav: params[:restaurant_fav],
                restaurant_details: params[:restaurant_details],
                attraction_fav: params[:attraction_fav],
                attraction_details: params[:attraction_details],
                recommendations: params[:recommendations],
                user_id: current_user.id
            )
            redirect "/destinations/#{@destination.id}"
        else
            redirect '/destinations/new'
        end

        if logged_in?
            @destination.user_id = current_user.id
            @destination.save
        end
        redirect "/destinations"
    end

    get '/destinations/:id' do
        @destination = Destination.find(params[:id])
        erb :'/destinations/show'
    end
end