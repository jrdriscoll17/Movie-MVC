class UsersController < ApplicationController
    get '/users/:id' do
        if User.find_by_id(params[:id])
            @user = User.find_by_id(params[:id])
            erb :'users/view'
        else
            redirect to '/users/login'
        end
    end

    get '/signup' do
        erb :'users/new'
    end

    post '/signup' do
        user = User.new(params)
        
        if user.valid?
            user.save
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            redirect to '/signup'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to "/users/#{session[:user_id]}"
        end
    end

    post '/login' do
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to "/users/#{user.id}"
        else
          redirect to '/signup'
        end
    end
    
    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/'
        end
    end
end