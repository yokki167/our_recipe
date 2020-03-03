class UsersController < ApplicationController

  def show
    # @recipe = Recipe.find(params[:id])

    @user = User.find(params[:id])
    @recipes = @user.recipes.order("created_at DESC")
    @liked = @user.liked_recipes.order("created_at DESC")
  end


end
