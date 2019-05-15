class RecipeController < ApplicationController

  # 1 - INDEX
  get "/recipes" do
    @recipes = Recipe.all
    erb :"recipes/index"
  end
  # 3 - NEW
  get "/recipes/new" do
    erb :"recipes/new"
  end
  # 2 - SHOW
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end
  # 4 - CREATE
  post "/recipes" do
    recipe = Recipe.create(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end
  # 5 - EDIT
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/edit"
  end
  # 6 - UPDATE
  patch "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end
  # 7 - DESTROY
  delete "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect "/recipes"
  end
end
