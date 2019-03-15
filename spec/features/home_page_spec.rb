require 'rails_helper'

feature 'Home Page' do
  scenario 'should include welcome message' do
    visit('/')
    expect(page).to have_content('Welcome to AskMate.com')
  end
end