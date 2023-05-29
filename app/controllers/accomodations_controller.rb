class AccomodationsController < ApplicationController
  def index
    @accomodations = Accomodation.all
  end

  def show
    @accomodation = Accomodation.find(params[:id])
  end

  def create
    @accomodation = Accomodation.new(params_accomodations)
    @accomodation.user = current_user
    if @accomodation.save
      redirect_to accomodation_path(@accomodation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_accomodations
    params.require(:accomodation).permit(:title, :description, :address, :nb_of_guests, photos: [])
  end
end
