class ActorsController < ApplicationController
    get '/actors' do
        @actors = Actor.all.sort_by{|actor| actor.name}
        erb :'actors/index'
    end

    get '/actors/:id' do
        @actor = Actor.find_by_id(params[:id])
        erb :'/actors/view'
    end
end