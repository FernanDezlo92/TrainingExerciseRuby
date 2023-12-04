# frozen_string_literal: true

class Round < ApplicationRecord
  include WithStartAndEndDate

  belongs_to :season
  has_many :matches, dependent: :destroy

  delegate :organization, to: :season
end
