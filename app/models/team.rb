# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :match
  has_many :team_players, dependent: :destroy
end
