feature "User signs out" do

  scenario 'user signs out' do
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

    expect(page).to have_content "Log out"

    visit destroy_user_session_path

    expect(page).to have_content "Signed out successfully."
  end
end
