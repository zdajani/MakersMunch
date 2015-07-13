require 'sinatra/base'
require './app/data_mapper_setup.rb'


class MakersMunch < Sinatra::Base

  get '/restaurant/new' do
    erb :'restaurant/new'
  end

  post '/restaurant/new' do
    Restaurant.create(name: params[:name], post_code: params[:post_code])
    redirect to('/restaurants')
  end

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurant/list'
  end

  run! if app_file == $0
end
