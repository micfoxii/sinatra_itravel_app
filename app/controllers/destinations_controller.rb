class DestinationsController < ApplicationController
    use Rack:Flash
    
    get '/destinations' do 
        @destinations = Destination.all 
        erb :'destinations/index'
    end

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
        destination_instance
        erb :'/destinations/show'
    end

    get '/destinations/:id/edit' do 
        destination_instance
        if @destination.user == current_user #TODO MAKE HELPER
            erb :'/destinations/edit'
        else
            redirect "/users/#{current_user.id}"
        end
    end

    patch '/destinations/:id' do 
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
                recommendations: params[:recommendations],
                user_id: current_user.id
                )
            redirect "/destinations/#{@destination.id}"
        else
           redirect "/users/#{current_user.id}"
        end
    end

    delete '/destinations/:id' do 
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