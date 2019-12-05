
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.new(params)
    article.save
    redirect to "articles/#{Article.last.id}"
  end


  get 'articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

end
