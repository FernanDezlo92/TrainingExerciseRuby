# frozen_string_literal: true

class Season < ApplicationRecord
  include WithStartAndEndDate

  has_many :rounds, dependent: :destroy
  belongs_to :organization
end
