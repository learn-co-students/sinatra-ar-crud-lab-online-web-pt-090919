
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new 
  end

  post '/articles' do 
    article = {title: params[:title], content: params[:content]}
    new_article = Article.create(article)
    redirect to('/articles/:id'), new_article.id 
  end
  
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show 
  end 

  get '/articles' do 
    @articles = Article.all 
    erb :index 
  end   
end
