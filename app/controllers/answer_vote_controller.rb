class AnswerVoteController < ApplicationController
  include VotableController

  before_action :set_votable

  private

  def set_votable
    @votable = AnswerVote
  end
end