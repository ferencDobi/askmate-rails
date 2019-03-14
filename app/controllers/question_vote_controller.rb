class QuestionVoteController < ApplicationController
  include VotableController

  before_action :set_votable

  private

  def set_votable
    @votable = QuestionVote
    params[:votable_id] = params[:question_id]
  end
end
