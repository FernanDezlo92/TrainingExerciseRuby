# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :match
  has_many :team_players, dependent: :destroy

  # validations
  validates :color, presence: true
  validates :match_id, numericality: { only_integer: true }

  # methods
  def players
    team_players.map(&:player)
  end

  def players_match
    players.map(&:match)
  end
end
