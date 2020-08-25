class MoviesController < ApplicationController
    get '/movies' do
        if logged_in?
            @movies = Movie.all

            erb :'movies/index'
        else
            redirect '/login'
        end
    end

    get '/movies/new' do
        erb :'movies/new'
    end

    post '/movies' do
        actor_ids = []
        params[:movie][:actors].each do |actor_name|
            actor = Actor.find_or_create_by(name: actor_name)
            actor_ids << actor.id
        end

        Movie.create(title: params[:movie][:title], genre_ids: params[:movie][:genre_ids], actor_ids: actor_ids)

        redirect '/movies'
        # binding.pry      
    end
end