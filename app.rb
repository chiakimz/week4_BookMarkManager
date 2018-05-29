require "sinatra/base"
require 'sinatra/flash'
require './database_connection_setup'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
  	p ENV
  	@bookmarks = Bookmark.all
  	erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  get '/add-a-new-bookmark' do
    erb :add_a_new_bookmark
  end

  post '/create-new-bookmark' do
    bookmark = Bookmark.create(url: params['url'], title: params['title'])

    flash[:notice] = "You must submit a valid URL." unless bookmark
    redirect '/'
  end

  delete '/bookmarks/:id/delete' do
    @bookmark = Bookmark.find(params['id'])
    Bookmark.delete(params['id'])
    redirect '/'
  end

  get '/bookmarks/:id/edit' do
    erb :'bookmarks/edit'
  end

  get '/bookmarks/:id' do
    @bookmark_id = params['id']
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params['id'], params)
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
