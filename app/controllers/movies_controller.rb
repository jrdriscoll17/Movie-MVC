class MoviesController < ApplicationController
    get '/movies' do
        @movies = Movie.all.sort_by{|movie| movie.title}
        erb :'movies/index'
    end

    get '/movies/new' do
        erb :'movies/new'
    end

    post '/movies' do
        actor_ids = []
        params[:movie][:actors].each do |actor_name|
            if actor_name != ""
                actor = Actor.find_or_create_by(name: actor_name)
                actor_ids << actor.id
            end
        end

        movie = Movie.find_by_id(params[:movie][:id])

        if movie_exists? && !movie.user_ids.include?(session[:user_id])
            movie.user_ids << session[:user_id]
            redirect to "/users/#{session[:user_id]}"
        elsif movie_exists? && movie.user_ids.include?(session[:user_id])
            erb :'/movies/new', locals: {message: "This movie already exists!"}
        else
            new_movie = Movie.create(title: params[:movie][:title].upcase, genre_ids: params[:movie][:genre_ids], actor_ids: actor_ids)
            new_movie.user_ids = [session[:user_id]]
            new_movie.save
            redirect '/movies'
        end   
    end

    get '/movies/:id/edit' do
        @movie = Movie.find_by_id(params[:id])
        erb :'/movies/edit'
    end

    get '/movies/:id' do
        @movie = Movie.find_by_id(params[:id])
        erb :'/movies/view'
    end

    patch '/movies/:id' do
        actor_ids = []
        params[:movie][:actors].each do |actor_name|
            actor = Actor.find_or_create_by(name: actor_name)
            actor_ids << actor.id
        end

        @movie = Movie.find_by_id(params[:id])
        @movie.update(title: params[:movie][:title].upcase, genre_ids: params[:movie][:genre_ids], actor_ids: actor_ids)

        redirect "/movies/#{@movie.id}"
    end

    delete '/movies/:id' do
        @movie = Movie.find_by_id(params[:id])
        @movie.delete

        redirect '/movies'
    end

    def movie_exists?
        titles = Movie.all.collect {|movie| movie.title}
        titles.include?(params[:movie][:title].upcase)
    end
end