class MoviesController < ApplicationController
  get '/movies' do
    @movies = Movie.all.sort_by { |movie| movie.title }
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
    movie = Movie.create(formatted_hash)

    if logged_in? && movie.valid?
      movie.user = current_user
      movie.save

      redirect '/movies'
    else
      redirect to '/login'
    end
  end

  get '/movies/:id/edit' do
    @movie = Movie.find_by_id(params[:id])

    if @movie.user != current_user || !logged_in?
      redirect to '/login'
    else
      erb :'/movies/edit'
    end
  end

  get '/movies/:id' do
    @movie = Movie.find_by_id(params[:id])
    erb :'/movies/view'
  end

  patch '/movies/:id' do
    @movie = Movie.find_by_id(params[:id])

    if @movie.user != current_user || !logged_in?
      redirect to '/login'
    else
      @movie.update(formatted_hash)
      redirect "/movies/#{@movie.id}"
    end
  end

  delete '/movies/:id' do
    @movie = Movie.find_by_id(params[:id])

    if @movie.user != current_user || !logged_in?
      redirect to '/login'
    else
      @movie.destroy

      redirect '/movies'
    end
  end

  def movie_exists?
    titles = Movie.all.collect { |movie| movie.title }
    titles.include?(params[:movie][:title].upcase)
  end

  def formatted_hash
    actor_ids = []
    params[:movie][:actors].each do |actor_name|
      if actor_name != ''
        actor = Actor.find_or_create_by(name: actor_name)
        actor_ids << actor.id
      end
    end

    { title: params[:movie][:title].upcase, genre_ids: params[:movie][:genre_ids], actor_ids: actor_ids }
  end
end
