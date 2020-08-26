class UsersController < ApplicationController
    get '/users' do
        @users = User.all

        erb :'users/index'
    end
    
    get '/users/:id' do
        if User.find_by_id(params[:id])
            @user = User.find_by_id(params[:id])
            erb :'users/view'
        end

        redirect to '/users/login'
    end

    get '/signup' do
        redirect to "/users/#{session[:user_id]}" if logged_in?

        erb :'users/new'
    end

    post '/signup' do
        user = User.new(params)
        
        if user.valid?
            user.save
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        end

        redirect to '/signup'
    end

    get '/login' do
        redirect to "/users/#{session[:user_id]}" if logged_in?

        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to "/users/#{user.id}"
        end

        redirect to '/signup'
    end
    
    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/'
        end
    end
end