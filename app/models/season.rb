# frozen_string_literal: true

class Season < ApplicationRecord
  include WithStartAndEndDate
  has_many :rounds, dependent: :destroy
  belongs_to :organization
  scope :active, -> { where("end_date >= ?", Time.now.in_time_zone) }
  scope :nonactive, -> { where("end_date < ?", Time.now.in_time_zone) }

  def season_year
    "#{start_date.year}-#{end_date.year}"
  end
end
