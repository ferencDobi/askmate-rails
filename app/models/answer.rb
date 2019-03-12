class Answer < ApplicationRecord
  include Ownable

  belongs_to :question
end
