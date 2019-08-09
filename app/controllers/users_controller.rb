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
        erb :'/users/signup'
    end

    post '/users' do
        if validate_signup
        @user = User.create(params)
        redirect "/users/#{@user.id}"
        else

        end
    end

    #SHOW ROUTE
    get '/users/:id' do
        @user = User.find_by(id: params[:id ])
        erb :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end