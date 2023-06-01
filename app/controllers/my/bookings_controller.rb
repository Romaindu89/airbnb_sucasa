module My
  class BookingsController < ApplicationController
    def index
      @upcoming_bookings = Booking.where("user_id = ? AND check_out_date > ?", current_user.id, DateTime.current.to_date)
      @past_bookings = Booking.where("user_id = ? AND check_out_date <= ?", current_user.id, DateTime.current.to_date)
    end

    def show
      @booking = Booking.find(params[:id])
    end

    def edit
      @booking = Booking.find(params[:id])
      @accommodation = Accommodation.find(@booking.accommodation_id)
    end

    def create
      @booking = Booking.new(params_booking)
      @booking.user = current_user
      @accommodation = Accommodation.find(params[:booking][:accommodation_id])
      check_in_date, check_out_date = params[:booking][:check_in_date].split(' to ')
      @booking.check_in_date = Date.parse(check_in_date)
      @booking.check_out_date = Date.parse(check_out_date)
      @booking.total_price = (@booking.check_out_date - @booking.check_in_date) * @accommodation.price_per_night
      if @booking.save
        redirect_to my_booking_path(@booking)
      else
        render "trip/bookings/new", status: :unprocessable_entity
      end
    end

    def update
      @booking = Booking.find(params[:id])
      @booking.user = current_user
      @accommodation = Accommodation.find(params[:booking][:accommodation_id])
      @booking.update(params_booking)
      check_in_date, check_out_date = params[:booking][:check_in_date].split(' to ')
      @booking.check_in_date = Date.parse(check_in_date)
      @booking.check_out_date = Date.parse(check_out_date)
      new_total_price = (@booking.check_out_date - @booking.check_in_date) * @accommodation.price_per_night
      if @booking.update(total_price: new_total_price)
        redirect_to my_bookings_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to my_bookings_path, status: :see_other
    end

    private

    def params_booking
      params.require(:booking).permit(
        :check_in_date,
        :check_out_date,
        :user_id,
        :accommodation_id,
        :nb_of_guests
      )
    end
  end
end
