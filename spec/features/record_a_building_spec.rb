require 'spec_helper'


feature 'register a real estate building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

# Acceptance Criteria:

# * I must specify a street address, city, state, and postal code
# * Only US states can be specified
# * I can optionally specify a description of the building
# * If I enter all of the required information in the required format, the building is recorded.
# * If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# * Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'register a building' do
    prev_count = Building.count

    visit '/buildings/new'

    fill_in 'Street Address', with: '1600 Pennsylvania Avenue'
    fill_in 'City', with: 'Washington'
    fill_in 'State', with: 'DC'
    fill_in 'Zipcode', with: '20500'
    fill_in 'Description', with: "a big white building where Obama sometimes stays. Another famous resident was Barney, George W's Scottish Terrier."

    click_button 'register'
    expect(page).to have_content('Building recorded.')
    expect(Building.count).to eq(prev_count + 1)
  end

  scenario 'create invalid building registration' do
    prev_count = Building.count
    visit '/buildings/new'
    fill_in 'State', with: 'CwjsjksljD'
    click_button 'register'
    expect(page).to have_content("can't be blank")
    expect(page).to have_content("CwjsjksljD is not a U.S. state")
    expect(Building.count).to eql(prev_count)

  end

end
