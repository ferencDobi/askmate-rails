module Votable
  extend ActiveSupport::Concern

  included do
    belongs_to :user

    enum direction: { down: -1, neutral: 0, up: 1 }
  end
end