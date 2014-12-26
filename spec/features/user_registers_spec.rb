require 'rails_helper'

feature "User visits the sign up page" do
#  As a user
#  I want to register for office space
#  so I can post my desk available for somebody to rent
#  Acceptance:
#  must enter an email and password

#  if all fields are completed i must see a success message
#  if incomplete, i must see an error message
#  if a certain field is incomplete, the form is rerendered and i am shown an error
#  if a user already exists in the database, i am given an error


  it "sees a title" do
    visit '/users/sign_up'
    expect(page).to have_content "New User Sign Up"
  end

  scenario 'user signs up' do
    user_attrs = {
      email: "Nclucas01@gmail.com",
      password: "password123"
      }

    user = User.new(user_attrs)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'user forgets a password' do
    user_attrs = {
      email: "Nclucas01@gmail.com",
      password: "password123"
    }

    user = User.new(user_attrs)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    click_on 'Sign up'

    expect(page).to have_content "Password can't be blank"
  end

  scenario 'user forgets their email' do

    visit new_user_registration_path
    click_on 'Sign up'

    expect(page).to have_content "Email can't be blank"
  end

  scenario 'user already exists' do
    user_1_attrs = {
      email: "nclucas01@gmail.com",
      password: "password123"
    }
    user_2_attrs = {
      email: "Nclucas01@gmail.com",
      password: "password123"
    }

    user1 = User.new(user_1_attrs)
    user2 = User.new(user_2_attrs)

    visit new_user_registration_path
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    fill_in 'Password confirmation', with: user1.password
    click_on 'Sign up'

    visit destroy_user_session_path
    visit new_user_registration_path
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    fill_in 'Password confirmation', with: user2.password
    click_on 'Sign up'

    expect(page).to have_content "Email has already been taken"
  end
end
