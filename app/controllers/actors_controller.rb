class ActorsController < ApplicationController
    get '/actors' do
        if logged_in?
            @actors = Actor.all

            erb :'actors/index'
        else
            redirect '/login'
        end
    end

    get '/actors/:id' do
        @actor = Actor.find_by_id(params[:id])
        
        erb :'/actors/view'
    end
end