class UsersController < ApplicationController
    get '/users' do
        if logged_in?
            @users = User.all
            erb :'users/index'
        else
            redirect '/login'
        end
    end
    
    get '/users/:id' do
        user = User.find_by_id(params[:id])
        
        if user && user.id == session[:user_id]
            @user = user
            erb :'users/view'
        else
            redirect to '/login'
        end
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
        if logged_in?
            redirect to "/users/#{session[:user_id]}"
        else 
            erb :'users/login'
        end
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