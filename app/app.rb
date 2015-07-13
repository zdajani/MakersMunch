require 'sinatra/base'
require './app/data_mapper_setup.rb'
require 'sinatra/flash'

class MakersMunch < Sinatra::Base

  get '/restaurant/new' do
    erb :'restaurant/new'
  end

  post '/restaurant/new' do
    @restaurant = Restaurant.create(name: params[:name], post_code: params[:post_code])
    if @restaurant.save
      redirect to('/restaurants')
    else
      flash.now[:errors] = @restaurant.errors.full_messages
    end
  end

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurant/list'
  end

  run! if app_file == $0
  enable :sessions
  register Sinatra::Flash


  get '/' do
    erb :index
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(full_name: params[:full_name],  email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  helpers do
      def current_user
         @current_user ||= User.get(session[:user_id])
       end
    end

  not_found do
    erb :error
  end
end
