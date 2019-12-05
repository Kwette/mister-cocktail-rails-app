class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:dose_id])

    @ingredient = Ingredient.new
  end

  def create
    @ingredient = ingredient.new(ingredient_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @dose.cocktail = Dose.find(params[:dose_id])
    @ingredient = Ingredient.find(params[:ingredient_id])


    if @ingredient.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end


  def destroy

    @ingredient = ingredient.find(params[:id])
    @ingredient.destroy
  end

   private

  def ingredient_params
    params.require(:ingredient).permit(:name, :cocktail_id, :dose_id)
  end
end

