module Trip
  class BookingsController < ApplicationController
    def new
      @booking = Booking.new
      @accommodation = Accommodation.find(params[:accommodation_id])
    end

    private

    def params_booking
      params.require(:booking).permit(
        :check_in_date,
        :check_out_date,
        :user_id,
        :accommodation_id,
        :nb_of_guests,
        :total_price
      )
    end
  end
end
