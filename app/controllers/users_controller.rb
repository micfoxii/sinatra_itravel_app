class UsersController < ApplicationController

    #login routes

    get '/login' do
        erb :login
    end

    #find user, authenticate user, login user, redirect user
    post '/login' do
        @user = User.find_by(email: params[:email])
        
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "users/#{@user.id}"
        else

        end
    end

    #TO DO SIGN UP ROUTE
    get '/signup' do

    end

    #SHOW ROUTE
    get '/users/:id' do
        "this is the show route"
    end
end