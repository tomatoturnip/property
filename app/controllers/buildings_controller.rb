class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def create
    @owner = Owner.find(params[:owner_id])
    @buildings = @owner.buildings

    # @building = Building.new(building_params)
    if @building.save
      redirect_to new_owner_building_path(@owner: owner), #'/buildings/new',
        notice: 'Building recorded.'
    else
      render action: 'new'
    end
  end

  def index
    @owner = Owner.find(params[:owner_id])
    @buildings = Building.all
  end

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :zipcode, :description, :owner_id)
  end

end
