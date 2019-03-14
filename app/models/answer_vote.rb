class AnswerVote < ApplicationRecord
  include Votable

  belongs_to :answer

  alias_attribute :votable_id, :answer_id
end