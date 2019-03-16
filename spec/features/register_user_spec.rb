require 'rails_helper'
require_relative '../support/signup_form'

feature 'Register user' do
  let(:defaults) do
    { username: 'Capybara', email: 'capy@bara.test', password: 'password' }
  end
  let(:signup_form) { SignupForm.new(*defaults.values) }

  scenario 'register a new user with valid data' do
    signup_form.visit_page.submit

    expect(page).to have_content "Welcome, #{defaults[:username]}!"

    user = User.last
    expect(user.email).to eq defaults[:email]
    expect(user.password_digest).to_not eq defaults[:password]
  end

  scenario 'cannot register when confirmation password does not match' do
    signup_form.visit_page.submit password_confirmation: 'not_matching'

    expect(page).to have_content 'Passwords must match.'
    expect(User.last).to eq nil
  end

  scenario 'cannot register when username is already taken' do
    create :user, username: 'Capybara'
    signup_form.visit_page.submit username: 'Capybara'

    expect(page).to have_content 'Username or email already in use.'
    expect(User.where(username: 'Capybara').count).to eq 1
  end

  scenario 'cannot register when email is already taken' do
    create :user, email: 'capy@bara.test'
    signup_form.visit_page.submit email: 'capy@bara.test'

    expect(page).to have_content 'Username or email already in use.'
    expect(User.where(email: 'capy@bara.test').count).to eq 1
  end
end