class Answer < ApplicationRecord
  belongs_to :user, default: -> { User.find_by_username('Anonymous') }
  belongs_to :question
end
