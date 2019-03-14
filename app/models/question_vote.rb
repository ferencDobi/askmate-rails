class QuestionVote < ApplicationRecord
  include Votable

  belongs_to :question

  alias_attribute :votable_id, :question_id
end