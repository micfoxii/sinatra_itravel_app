class DestinationsController < ApplicationController

    get '/destinations/new' do 
        erb:'/destinations/new'
    end

    post '/destinations/new' do
        raise params.inspect
        #if logged in values not nil save
        #if not logged in redirect to login
    end
end