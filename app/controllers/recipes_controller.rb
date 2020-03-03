class RecipesController < ApplicationController

  # before_action :set_ing only: :show
  before_action :movie_to_index, except: [:index, :show]

  def index
    @recipes = Recipe.includes(:user).order("created_at DESC")
    

  end

  def new
    @recipe = Recipe.new
    @recipelists = @recipe.recipelists.build 
    @ingredients = @recipe.ingredients.build 
    # @recipelists.ingredients.build

  end

  def create
    # binding.pry
    Recipe.create!(recipe_params)
    redirect_to root_path
  end

  def show
    # binding.pry
    @recipe = Recipe.find(params[:id])
    @like = Like.new
    a = @recipe.ingredients
    # @calculation = @recipe.calculations.new(calculation_params)


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
    # binding.pry
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to root_path

  end

  private
  def recipe_params
    params.require(:recipe).permit(
        :title , :time, :image, :serving, :worktime, :oneword, :point,
         recipelists_attributes: [:id, :text, :image, :recipe_id, :_destroy],
         ingredients_attributes:[:id, :iname, :amount, :recipe_id, :_destroy])
         .merge(user_id: current_user.id)
  end

  # def calculation_params
  #   params.require(:calculation).permit(:calc).merge(user_id: current_user.id)
  # end


  # def set_ing
  #   @a = Recipe.find(params[:recipe_id])
  # end

  def movie_to_index
    redirect_to action: :index  unless user_signed_in?
  end



end
