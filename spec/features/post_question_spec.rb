require 'rails_helper'

feature 'Post question' do
  scenario 'should post new question with valid data' do
    visit '/'
    click_button 'Post question'

    fill_in 'Question title:', with: 'Will this test pass?'
    fill_in 'Detailed description:', with: 'I wrote an acceptance test. Will it pass?'
    click_button 'Submit question'

    expect(page).to have_content 'Will this test pass?'
    expect(Question.last.title).to eq 'Will this test pass?'
  end
end