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

  scenario 'cannot register when confirmation password does not match' do
    visit signup_path

    within '#new_user' do
      fill_in 'Username:', with: 'Capybara'
      fill_in 'Password:', with: 'password'
      fill_in 'Confirm password:', with: 'not_matching'
      fill_in 'E-mail address:', with: 'capy@bara.test'
      click_button 'Register'
    end

    expect(page).to have_content 'Passwords must match.'
    expect(User.last).to eq nil
  end

  scenario 'cannot register when username or email already taken' do
    User.create(username: 'Capybara', email: 'capy@bara.test',
                password_digest: BCrypt::Password.create('password'))

    visit signup_path

    within '#new_user' do
      fill_in 'Username:', with: 'Capybara'
      fill_in 'Password:', with: 'password'
      fill_in 'Confirm password:', with: 'password'
      fill_in 'E-mail address:', with: 'capy@bara.test'
      click_button 'Register'
    end

    expect(page).to have_content 'Username or email already in use.'
    expect(User.where(username: 'Capybara').count).to eq 1
  end
end