# frozen_string_literal: true

class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  # validations
  validates :player_id, uniqueness: { scope: :team_id }
end
