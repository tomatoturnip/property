require 'spec_helper'

feature 'register an owner of a building', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

# Acceptance Criteria:
  # * I must specify a first name, last name, and email address
  # * I can optionally specify a company name
  # * If I do not specify the required information, I am presented with errors
  # * If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'register an owner' do
    prev_count = Owner.count

    visit new_owner_path

    fill_in 'First Name', with: 'Lydia'
    fill_in 'Last Name', with: 'Ho'
    fill_in 'Company', with: 'DogsRUs'

    click_button 'register'
    expect(page).to have_content('Owner recorded')
    expect(Owner.count).to eq(prev_count + 1)
  end

    scenario 'create invalid owner registration' do
      prev_count = Owner.count
      visit new_owner_path

      click_button 'register'
      expect(page).to have_content("can't be blank")
      expect(Owner.count).to eql(prev_count)
    end

  end



