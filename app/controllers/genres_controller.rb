class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all.sort_by { |genre| genre.name }
    erb :'genres/index'
  end

  get '/genres/:id' do
    @genre = Genre.find_by_id(params[:id])
    erb :'/genres/view'
  end
end
