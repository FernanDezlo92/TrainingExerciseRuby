# frozen_string_literal: true

class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  # validations
  validates :player_id, uniqueness: { scope: :team_id }

  validate :check_player_in_opponent

  private

  def check_player_in_opponent
    errors.add(:player, "same player in both teams") if team.team_vs && team.team_vs.players.include?(player)
  end
end
