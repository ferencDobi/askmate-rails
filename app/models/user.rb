class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  has_secure_password
end
