class DestinationsController < ApplicationController
    # use Rack::Flash
    
    get '/destinations' do
        redirect_if_not_logged_in 
        @destinations = Destination.all 
        erb :'destinations/index'
    end

    get '/user_destinations' do 
        redirect_if_not_logged_in
        @destinations = current_user.destinations
        erb :'destinations/index'
    end

    get '/destinations/new' do
        redirect_if_not_logged_in
        if logged_in?
        erb:'/destinations/new'
        else
            redirect '/'
        end
    end

    post '/destinations' do
        redirect_if_not_logged_in
        @destination = current_user.destinations.build(params)
        if @destination.save
            redirect '/user_destinations'
        else
            @errors = @destination.errors.full_messages
            erb :'destinations/new'
        end
    end

    get '/destinations/:id' do
        redirect_if_not_logged_in
        destination_instance
        erb :'/destinations/show'
    end

    get '/destinations/:id/edit' do 
        redirect_if_not_logged_in
        destination_instance
        if @destination.user == current_user #TODO MAKE HELPER
            erb :'/destinations/edit'
        else
            redirect "/users/#{current_user.id}"
        end
    end

    patch '/destinations/:id' do 
        redirect_if_not_logged_in
        destination_instance
        if @destination.user == current_user #TODO MAKE HELPER
            @destination.update(
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
                recommendations: params[:recommendations]
            )
            redirect "/destinations/#{@destination.id}"
        else
            redirect "/users/#{current_user.id}"
        end
    end

    delete '/destinations/:id' do 
        redirect_if_not_logged_in
        destination_instance
        if authorized_to_edit?(@destination)
            @destination.destroy
            redirect '/destinations'
        else
            redirect '/destinations'
        end
    end

    ## Class Helper ##

    def destination_instance
        @destination = Destination.find(params[:id])
    end
end