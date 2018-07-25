require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :'new'
  end

  post '/posts' do
    post = Post.create(name: params[:name], content: params[:content])
    post.save
    @post = Post.all
    erb :'index'
  end

  get '/' do
    @post = Post.all
    erb :'index'
  end

  get '/posts/:id' do
    binding.pry
    @post = Post.find(params[:post][:id]).first
    erb :'show'
  end
end
