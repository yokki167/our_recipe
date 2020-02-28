class UsersController < ApplicationController

  def show
    # @recipe = Recipe.find(params[:id])

    @user = User.find(params[:id])
    @recipes = @user.recipes
  end



end
