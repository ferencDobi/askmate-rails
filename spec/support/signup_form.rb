class SignupForm
  include Capybara::DSL

  def initialize(username, email, password)
    @username = username
    @email = email
    @password = password
  end

  def visit_page
    visit 'signup'
    self
  end

  def submit(params = {})
    within '#new_user' do
      fill_in 'Username:', with: params.fetch(:username, @username)
      fill_in 'Password:', with: params.fetch(:password, @password)
      fill_in 'Confirm password:', with: params.fetch(:password_confirmation, @password)
      fill_in 'E-mail address:', with: params.fetch(:email, @email)
      click_button 'Register'
    end
  end
end