module VotableController
  extend ActiveSupport::Concern

  def up
    save :up if current_user
  end

  def down
    save :down if current_user
  end

  def save(vote_direction)
    @votable.where(votable_id: params[:votable_id], user_id: @current_user.id)
            .first_or_create!.tap do |vote|
      vote.direction = vote_direction
      vote.save
    end
  end

end