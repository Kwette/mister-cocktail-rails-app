class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to new_cocktail_dose_path(@dose.cocktail)
    else
      render :new
    end
  end

  # def edit
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.find(params[:id])
  # end

  # def update
  #   @dose = Dose.find(params[:id])
  #   @dose.cocktail.update(dose_params)
  #   redirect_to cocktail_path(@dose.cocktail)
  # end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to new_cocktail_dose_path(@dose.cocktail)
  end

   private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
