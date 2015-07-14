require 'sinatra/base'
require './app/data_mapper_setup.rb'
require 'sinatra/flash'

class MakersMunch < Sinatra::Base
  run! if app_file == $0
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/restaurant/new' do
    if current_user
      erb :'restaurant/new'
    else
      redirect '/'
    end
  end

  post '/restaurant/new' do
    @restaurant = Restaurant.create(name: params[:name], place_id: params[:place_id])
    tags = []
    tags << params[:tag1]
    tags << params[:tag2]
    tags.each do |tag|
    tag_exist = Tag.first(:name => tag)
      if tag_exist
        @restaurant.tags << tag_exist
      else
        tag = tag.split
        tag = tag.join
        @restaurant.tags << Tag.create(name: tag)
      end
    end
    if @restaurant.save
      redirect to('/')
    else
      flash.now[:errors] = @restaurant.errors.full_messages
      erb :'restaurant/new'
    end
  end

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurant/list'
  end

  get '/' do
    @restaurants = Restaurant.all
    erb :index
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user/new' do
    @user = User.create(full_name: params[:full_name],  email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/log_in' do
    erb :'session/new'
  end

  post '/log_in' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'session/new'
    end
  end

  delete '/log_in' do
    session[:user_id] = nil
    redirect to('/')
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  not_found do
    erb :error
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @restaurants = tag ? tag.restaurants : []
    erb :index
  end

  get '/dropdown' do
    @tags = Tag.all
    erb :dropdown
  end

  post '/dropdown' do
    tag = params[:food_tags]
    tag = tag.split
    tag = tag.join
    redirect to("/tags/#{tag}")
  end
end
