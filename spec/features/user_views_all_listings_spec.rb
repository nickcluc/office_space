require 'rails_helper'

feature "User views all listings" do
  # As a user
  # I want to view a list of all available listings
  # so I can rent an office for a week.

  # Acceptance
  # Must have the title 'All Listings'
  # Must see all the available listings
  # must see each listings city, state, and average daily rate in dollars

  it 'sees a title' do
    visit '/listings'
    expect(page).to have_content "All Listings"
  end
end
