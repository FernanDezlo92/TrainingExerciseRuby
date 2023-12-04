# frozen_string_literal: true

FactoryBot.define do
  factory :team_player do
    team { association(:team) }
    player { association(:player, organization: team.organization) }
  end
end
