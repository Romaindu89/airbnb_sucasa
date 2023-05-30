class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @accommodation = Accommodation.find(params[:booking][:accommodation_id])
    @booking.total_price = (@booking.check_out_date - @booking.check_in_date) * @accommodation.price_per_night
    if @booking.save
      redirect_to accommodations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:check_in_date, :check_out_date, :user_id, :accommodation_id, :nb_of_guests)
  end
end
