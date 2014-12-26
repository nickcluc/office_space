require 'rails_helper'

feature "User adds a new listing" do
  # As a user
  # I want to add my desk for rent
  # So i can make extra money over Christmas Break

  # Acceptance:
  # -Must see the page title "Create a New Listing"
  # -Must fill out the form completely
  # -If for is fille dout correctly, reirects to listings and
  #   sees a "Listing Created Successfully" message
  # -If not, the new page is rerendered and an error shows.

  it 'sees the new listing page' do
    visit '/listings/new'
    expect(page).to have_content "Create New Listing"
  end

  scenario 'user fills out new listing form' do

    listing_attrs = {
      title: "Desk @ Launch Academy",
      address: "33 Harrison Ave. Suite 501",
      city: "Boston",
      state: "MA",
      zip_code: "02201",
      description: "Great seat near the coffee machine!",
      daily_rate_cents: 10000
    }

    listing = Listing.new(listing_attrs)

    visit new_listing_path

    fill_in "Title", with: listing.title
    fill_in "Address", with: listing.address
    fill_in "City", with: listing.city
    fill_in "State", with: listing.state
    fill_in "Zip code", with: listing.zip_code
    fill_in "Description", with: listing.description
    fill_in "Daily Rate", with: listing.daily_rate_cents
    click_on "Add Listing"
  end
end
