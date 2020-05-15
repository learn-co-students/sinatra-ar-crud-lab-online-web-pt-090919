require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/articles' do 
    @articles = Article.all 
    erb :index
  end
  
  get '/articles/new' do 
    erb :new
  end
  
  post '/articles' do 
    @article = Article.create(title: params[:article][:title], content: params[:article][:content])
    redirect "/articles/#{@article.id}"
  end
  
  get '/articles/:id' do |id|
    @article = Article.find(id)
    erb :show
  end
  
  get '/articles/:id/edit' do |id|
    @article = Article.find(id)
    erb :edit
  end
  
  patch '/articles/:id' do |id|
    Article.update(id, params[:article])
    redirect "/articles/#{id}"
  end
  
  delete '/articles/:id' do |id|
    Article.delete(id)
    redirect '/articles'
  end
  
end








