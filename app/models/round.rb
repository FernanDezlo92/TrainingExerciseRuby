# frozen_string_literal: true

class Round < ApplicationRecord
  include WithStartAndEndDate

  belongs_to :season
  has_many :matches, dependent: :destroy

  delegate :organization, to: :season
  scope :active, -> { where("end_date >= ?", Time.now.in_time_zone) }
end
