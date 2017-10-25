class CatRentalRequestController < ApplicationController

  def index
    render json: CatRentalRequest.all
  end

  def new
    @rental_request = CatRentalRequest.new
    render :new
  end

  def create
  end

private

def rental_params
  params.require(:rental_request).permit(:birth_date, :color, :name, :sex, :description).
end

end
