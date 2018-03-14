require "sinatra/base"
require './lib/link'

class BookmarkManager < Sinatra::Base
  enable :sessions		
  get '/' do
  	p ENV
  	@links = Link.all
  	erb :index
  end
  run! if app_file == $0
end  	