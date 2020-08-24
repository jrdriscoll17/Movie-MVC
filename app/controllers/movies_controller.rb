class MoviesController < ApplicationController
    get '/movies' do
        if logged_in?
            # @movies = Movies.all

            erb :'movies/index'
        else
            redirect '/login'
        end
    end
end