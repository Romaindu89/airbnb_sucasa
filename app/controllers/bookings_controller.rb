class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    @accommodation = Accommodation.find(params[:accommodation_id])
    authorize @accommodation
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @accommodation = Accommodation.find(params[:booking][:accommodation_id])
    @booking.total_price = (@booking.check_out_date - @booking.check_in_date) * @accommodation.price_per_night
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render :new, status: :unprocessable_entity
    end
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
