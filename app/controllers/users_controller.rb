class UsersController < ApplicationController
    #login routes

    get '/login' do
        erb :'/users/login'
    end

    #find user, authenticate user, login user, redirect user
    post '/login' do
        @user = User.find_by(email: params[:email])
        
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else

        end
    end

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.create(params)
        if user.save
            session[:user_id] = user.id
            redirect '/' #"/users/#{@user.id}"
        else
            #TODO ADD FLASH MESSAGE
            @errors = user.errors.full_messages
            erb :'users/signup'
        end
    end

    #SHOW ROUTE
    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end