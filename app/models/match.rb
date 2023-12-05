# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :round
  has_many :teams, dependent: :destroy
  delegate :organization, to: :round

  # Method

  def team_for_player(player)
    teams.each do |team|
      return team if team.players.include?(player)
    end
    nil
  end
end
