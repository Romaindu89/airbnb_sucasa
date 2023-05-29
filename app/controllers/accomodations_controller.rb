class AccomodationsController < ApplicationController
  def index
    @accomodations = Accomodation.all
  end

  def show
    @accomodation = Accomodation.find(params[:id])
  end
end
