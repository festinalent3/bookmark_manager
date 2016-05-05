ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base

enable :sessions
set :session_sectret, 'super secret'
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title:params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end


  get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :links
end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/new' do
     User.create(email: params[:email],
              password: params[:password])
     session[:user_id] = user.id
    redirect '/user/welcome'
  end

  get '/user/welcome' do
    erb :'user/welcome'
  end

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
