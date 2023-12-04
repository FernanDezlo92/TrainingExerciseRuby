# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :match
  has_many :team_players, dependent: :destroy
  has_many :players, through: :team_players

  # validations
  validates :color, presence: true

  delegate :organization, to: :match

  # methods
  def team_vs
    match.teams.where.not(id:).first
  end
end
