class DestinationsController < ApplicationController

    get '/destinations/new' do 
        erb:'/destinations/new'
    end
end