module My
  class BookingsController < ApplicationController
    def index
      @bookings = Booking.where(user: current_user)
      # @accommodation = Accommodation.find(@booking.accommodation_id)
    end
  end
end
