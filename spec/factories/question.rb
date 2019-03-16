FactoryBot.define do
  factory :question do
    sequence(:title) { |n| "Question #{n}?" }
    message { 'A test message.' }
    image { 'https://presskit.thoughtbot.com/assets/images/logo.svg' }
    views { Random.new.rand(100) }
    upvotes { Random.new.rand(100) }
    association :user, factory: :user
  end
end