class UsersController < ApplicationController
    get '/users/:id' do
        @user = User.find_by_id(params[:id])

        erb :'users/show'
    end

    get '/signup' do
        if !logged_in?
            erb :'users/new', locals: {message: "Create an account to start your movie collection!"}
        else
            redirect to '/movies'
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        else
            @user = User.new(username: params[:username], email: params[:email], password: params[:password])
            @user.save

            session[:user_id] = @user.id

            redirect to '/movies'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to '/movies'
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user #&& user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to "/movies"
        else
          redirect to '/signup'
        end
      end
    
    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end
end