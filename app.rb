require "sinatra/base"
require 'sinatra/flash'
require './database_connection_setup'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
  	p ENV
  	@links = Link.all
  	erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  get '/add-a-new-link' do
    erb :add_a_new_link
  end

  post '/create-new-link' do
    flash[:notice] = "You must submit a valid URL." unless link
    redirect('/')
  end

  run! if app_file == $0
end
