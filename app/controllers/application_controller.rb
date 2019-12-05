
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get 'articles/:id' do
    erb :show
  end

  post '/articles' do
    @article = Article.create(params)
    # redirect 'articles/"#{Article.last.id}"'

    erb :show
  end
end
