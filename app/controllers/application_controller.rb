
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Base
  get '/' do
  end
  
  #New
  get '/articles/new' do
    erb :new
  end
  
  #Create
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end
  
  #Show
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end
  
  #Index
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  #Update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end
  
  delete '/articles/:id' do
    Article.delete(params[:id])
  end
  
end
