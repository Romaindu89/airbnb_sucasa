class AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all
    if params[:query].present?
      @accommodations = @accommodations.where("address ILIKE ?", "%#{params[:query]}%").all
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
    authorize @accommodation
    @accommodations = Accommodation.all.sample(4)
  end

  def create
    @accommodation = Accommodation.new(params_accommodations)
    @accommodation.user = current_user
    authorize @accommodation
    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    authorize @accommodation
    if @accommodation.update(params_accommodations)
      redirect_to my_accommodations_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])
    authorize @accommodation
    @accommodation.destroy
    redirect_to my_accommodations_path, status: :see_other
  end

  private

  def params_accommodations
    params.require(:accommodation).permit(:title, :description, :address, :nb_of_guests, :price_per_night, photos: [])
  end
end
