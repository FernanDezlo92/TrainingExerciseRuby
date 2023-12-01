# frozen_string_literal: true

class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player
end
