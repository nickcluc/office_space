feature "User visits sign in page" do

  scenario 'user signs in' do
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

    visit destroy_user_session_path
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    expect(page).to have_content "Signed in successfully."
  end
  scenario 'user signs in with an email that doesnt exist' do
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

    visit destroy_user_session_path
    visit new_user_session_path

    fill_in 'Email', with: "Nclucas00@gmail.com"
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    expect(page).to have_content "Invalid email"
  end
  scenario 'user signs in with the wrong password' do
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

    visit destroy_user_session_path
    visit new_user_session_path

    fill_in 'Email', with: "Nclucas01@gmail.com"
    fill_in 'Password', with: "fkhfakhsf"
    click_on 'Sign in'

    expect(page).to have_content "Invalid email or password"
  end
end
