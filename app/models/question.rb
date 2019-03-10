class Question < ApplicationRecord
  belongs_to :user, default: -> { User.find_by_username('Anonymous') }
end
