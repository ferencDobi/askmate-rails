require 'rails_helper'

feature 'Home Page' do
  scenario 'welcome user' do
    visit '/'
    expect(page).to have_content('Welcome to AskMate.com')
  end

  scenario 'show 5 most recent questions' do
    create_list :question, 6
    visit '/'

    expect(page).to have_content('Recent questions')

    (2..6).each do |n|
      expect(page).to have_content("Question #{n}?")
    end

    expect(page).not_to have_content('Question 1?')
    expect(page).to have_selector('.question-container', count: 5)
  end
end