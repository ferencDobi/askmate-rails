FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "TestUser#{n}" }
    sequence(:email) { |n| "factory#{n}@bot.test" }
    password_digest { BCrypt::Password.create('password') }
    first_name { 'Test' }
    last_name { 'User' }
    birthday { Date.new(1990, 1, 1) }
  end
end