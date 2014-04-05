class BuildingsController < ApplicationController
  before_filter :load_owner, only: [:index, :create]

  def new
    @building = Building.new
  end

  def create
    if @building.save
      redirect_to(
        new_owner_building_path(owner: @owner),
        { notice: 'Building recorded.' }
      )
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

  def load_owner
    @owner = Owner.find(params[:owner_id])
  end

end
