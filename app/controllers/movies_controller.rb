class MoviesController < ApplicationController
    get '/movies' do
        if logged_in?
            if @movies
                @movies = Movies.all
            end

            erb :'movies/index'
        else
            redirect '/login'
        end
    end

    get '/movies/new' do
        erb :'movies/new'
    end
end