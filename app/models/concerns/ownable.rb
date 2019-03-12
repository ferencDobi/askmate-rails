module Ownable
  extend ActiveSupport::Concern

  included do
    belongs_to :user, default: lambda {
      User.create_with(email: 'guest@askmate.com',
                       password_digest: BCrypt::Password.create(SecureRandom.uuid))
          .find_or_create_by!(username: 'Anonymous')
    }
  end

end