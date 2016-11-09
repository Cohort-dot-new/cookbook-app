class RecipesController < ApplicationController
  def first_recipe_method
    @recipe = Recipe.first
    render 'first_recipe.html.erb'
  end
end
