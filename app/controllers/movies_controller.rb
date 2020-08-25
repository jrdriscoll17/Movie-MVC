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

        if movie_exists?
            erb :'/movies/new', locals: {message: "This movie already exists!"}
        else
            Movie.create(title: params[:movie][:title].upcase, genre_ids: params[:movie][:genre_ids], actor_ids: actor_ids)
            redirect '/movies'
        end   
    end

    def movie_exists?
        titles = Movie.all.collect {|movie| movie.title}
        titles.include?(params[:movie][:title])
    end
end