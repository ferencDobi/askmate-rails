class Question < ApplicationRecord
  include Ownable

  has_many :answers, dependent: :destroy
end
