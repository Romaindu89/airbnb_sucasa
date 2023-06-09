module My
  class AccommodationsController < ApplicationController
    def index
      @accommodations = Accommodation.where(user: current_user)
    end

    def new
      @accommodation = Accommodation.new
      authorize @accommodation
    end

    def edit
      @accommodation = Accommodation.find(params[:id])
      authorize @accommodation
    end

    private

    def params_accommodations
      params.require(:accommodation).permit(:title, :description, :address, :nb_of_guests, photos: [])
    end
  end
end
