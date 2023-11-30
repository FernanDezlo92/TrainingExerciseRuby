# frozen_string_literal: true

class Organization < ApplicationRecord
  has_one_attached :logo
  has_many :players, dependent: :destroy
  has_many :seasons, dependent: :destroy
  has_many :users, through: :players
end
