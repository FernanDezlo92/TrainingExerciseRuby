# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :team_players, dependent: :destroy
end
