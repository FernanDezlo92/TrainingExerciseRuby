# frozen_string_literal: true

class Organization < ApplicationRecord
  has_one_attached :logo
end
