# Can you create a popup without a redirect?
# Can params be used inside a helper method?

class MoviesController < ApplicationController
    get '/movies' do
        @movies = Movie.all.sort_by{|movie| movie.title}
        erb :'movies/index'
    end

    get '/movies/new' do
        if logged_in?
            erb :'movies/new'
        else
            redirect to '/login'
        end
    end

    post '/movies' do
        if logged_in?
            actor_ids = []
            params[:movie][:actors].each do |actor_name|
                if actor_name != ""
                    actor = Actor.find_or_create_by(name: actor_name)
                    actor_ids << actor.id
                end
            end

            movie = Movie.create(title: params[:movie][:title].upcase, genre_ids: params[:movie][:genre_ids], actor_ids: actor_ids)
            movie.user = current_user
            movie.save

            redirect '/movies'
        else
            redirect to '/login'
        end
    end

    get '/movies/:id/edit' do
        @movie = Movie.find_by_id(params[:id])

        if @movie.user == current_user
            if logged_in? && @movie.valid?
                erb :'/movies/edit'
            else logged_in? && !@movie.valid?
                redirect to '/login'
            end
        else

        end
    end

    get '/movies/:id' do
        @movie = Movie.find_by_id(params[:id])
        erb :'/movies/view'
    end

    patch '/movies/:id' do
        @movie = Movie.find_by_id(params[:id])
        
        if @movie.user == current_user
            if logged_in?
                actor_ids = []
                params[:movie][:actors].each do |actor_name|
                    actor = Actor.find_or_create_by(name: actor_name)
                    actor_ids << actor.id
                end
    
                @movie.update(title: params[:movie][:title].upcase, genre_ids: params[:movie][:genre_ids], actor_ids: actor_ids)
    
                redirect "/movies/#{@movie.id}"
            else
                redirect to '/login'
            end
        else
            
        end
    end

    delete '/movies/:id' do
        @movie = Movie.find_by_id(params[:id])
        
        if @movie.user == current_user
            if logged_in?
                @movie.delete
    
                redirect '/movies'
            else
                redirect to '/login'
            end
        else
            
        end
    end

    def movie_exists?
        titles = Movie.all.collect {|movie| movie.title}
        titles.include?(params[:movie][:title].upcase)
    end

    def formatted_hash
        actor_ids = []
        params[:movie][:actors].each do |actor_name|
            actor = Actor.find_or_create_by(name: actor_name)
            actor_ids << actor.id
        end

        hash = {title: params[:movie][:title].upcase, genre_ids: params[:movie][:genre_ids], actor_ids: actor_ids}
    end
end