class LikesController < ApplicationController
  before_action :set_recipe

  def create
    @like = current_user.likes.create(recipe_id: params[:recipe_id])
  end

  def destroy
    @like = Like.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    @like.destroy
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
  

end
