class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user)
  end

  def new
    @recipe = Recipe.new
    @recipelists = 3.times { @recipe.recipelists.build }
    @ingredients = 5.times { @recipe.ingredients.build }

  end

  def create
    Recipe.create(recipe_params)
    redirect_to root_path
  end

  def show
    @recipe = Recipe.find(params[:id])
    @like = Like.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe_path(recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to root_path

  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :time, :image, :serving, recipelists_attributes:[:text, :image, :recipe_id], recipelists_attributes:[:iname, :amount, :recipe_id]).merge(user_id: current_user.id)
  end


end
