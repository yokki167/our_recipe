class RecipesController < ApplicationController
  before_action :movie_to_index, except: [:index, :show, :search, :category, :detail_search, :simplesearch]
  before_action :recipe_find, except: [:index, :new, :create, :simplesearch, :category, :detail_search]

  def index
    @recipes = Recipe.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @recipe = Recipe.new
    @recipelists = @recipe.recipelists.build 
    @ingredients = @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @like = Like.new
    a = @recipe.ingredients
  end

  def edit    
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to root_path
    else
      redirect_to recipe_path(@recipe.id)
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  
  def simplesearch
    @recipe_simple = Recipe.simplesearch(params[:keyword])
  end

  def category
    @recipes=[]
    @recipe = Recipe.where(dish_id: params[:id])
    @recipes<<@recipe

    @recipe = Recipe.where(mainmaterial_id: params[:id])
    @recipes<<@recipe

    @recipe = Recipe.where(eattime_id: params[:id])

    @recipes<<@recipe
  end

  def detail_search
    @search_params = recipe_search_params
    @recipes = Recipe.search(@search_params).order("created_at DESC").page(params[:page]).per(20)
  end

  private
  def recipe_params
    params.require(:recipe).permit(
        :title , :time, :image, :serving, :oneword, :dish_id, :eattime_id, :mainmaterial_id, :point,
         recipelists_attributes: [:id, :text, :image, :recipe_id, :_destroy],
         ingredients_attributes:[:id, :iname, :amount, :recipe_id, :_destroy])
         .merge(user_id: current_user.id)
  end

  def recipe_search_params
    params.fetch(:search, {}).permit(:title, :time_from, :time_to)
  end

  def movie_to_index
    redirect_to action: :index  unless user_signed_in?
  end

  def recipe_find
    @recipe = Recipe.find(params[:id])
  end 

end
