class Question < ApplicationRecord
  belongs_to :user, default: lambda {
    User.create_with(email: 'guest@askmate.com',
                     password_digest: BCrypt::Password.create(SecureRandom.uuid))
        .find_or_create_by!(username: 'Anonymous')
  }

  has_many :answers, dependent: :destroy
end
