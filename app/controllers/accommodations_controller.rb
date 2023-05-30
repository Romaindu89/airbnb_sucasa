class AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all
  end

  def show
    @accommodation = Accommodation.find(params[:id])
  end

  def create
    @accommodation = Accommodation.new(params_accommodations)
    @accommodation.user = current_user
    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_accommodations
    params.require(:accommodation).permit(:title, :description, :address, :nb_of_guests, photos: [])
  end
end
