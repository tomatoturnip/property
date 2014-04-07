class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to buildings_path, notice: 'Building recorded.'
    else
      render action: 'new'
    end
  end

  def index
    @buildings = Building.all
  end

  private

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :zipcode, :description, :owner_id)
  end
end
