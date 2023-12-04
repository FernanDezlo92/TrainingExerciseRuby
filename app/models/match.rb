# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :round
  has_many :teams, dependent: :destroy

  delegate :organization, to: :round
end
