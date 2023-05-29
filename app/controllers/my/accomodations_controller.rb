module My
  class AccomodationsController < ApplicationController
    def index
      @accomodations = Accomodation.where(user: current_user)
    end

    def new
      @accomodation = Accomodation.new
    end

    private

    def params_accomodations
      params.require(:accomodation).permit(:title, :description, :address, :nb_of_guests, photos: [])
    end
  end
end
