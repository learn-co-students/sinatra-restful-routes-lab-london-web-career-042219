require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  # index

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #new
  get '/recipes/new' do
    erb :new
  end

  #show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #create
  post '/recipes' do
    recipe = Recipe.create params
    # binding.pry
    redirect "/recipes/#{recipe.id}"
  end

  #edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #update
  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.update(params)
    redirect "/recipes/#{recipe.id}"
  end

  #delete
  delete '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect '/recipes'
  end

end
