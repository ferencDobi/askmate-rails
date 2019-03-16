require 'rails_helper'

feature 'Register user' do
  scenario 'register a new user with valid data' do
    visit signup_path

    within '#new_user' do
      fill_in 'Username:', with: 'Capybara'
      fill_in 'Password:', with: 'password'
      fill_in 'Confirm password:', with: 'password'
      fill_in 'E-mail address:', with: 'capy@bara.test'
      click_button 'Register'
    end

    expect(page).to have_content 'Welcome, Capybara!'

    user = User.last
    expect(user.email).to eq 'capy@bara.test'
    expect(user.password_digest).to_not eq 'password'
  end
end