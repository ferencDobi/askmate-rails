require 'rails_helper'

feature 'Post question' do
  scenario 'post new question with valid data' do
    visit '/'
    click_button 'Post question'

    fill_in 'Question title:', with: 'Will this test pass?'
    fill_in 'Detailed description:', with: 'I wrote an acceptance test. Will it pass?'
    click_button 'Submit question'

    expect(page).to have_content 'Will this test pass?'
    expect(page).to have_content 'I wrote an acceptance test. Will it pass?'

    question = Question.last

    expect(question.title).to eq 'Will this test pass?'
    expect(question.message).to eq 'I wrote an acceptance test. Will it pass?'
  end

  scenario 'fill out form then reset it', js: true do
    visit '/'
    click_button 'Post question'

    fill_in 'Question title:', with: 'Will this test pass?'
    fill_in 'Detailed description:', with: 'I wrote an acceptance test. Will it pass?'
    click_button 'Reset'

    expect(find_field('Question title:').value).to eq ''
    expect(find_field('Detailed description:').value).to eq ''
  end
end