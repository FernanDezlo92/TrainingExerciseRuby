# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :team_players, dependent: :destroy
  has_many :teams, through: :team_players

  # Method

  def points_by_match(match)
    Rails.cache.fetch("player-points-by-match-#{match.id}-#{id}") do
      team = match.team_for_player(self)
      return 0 unless team

      team.points
    end
  end

  def clear_points_by_match_cache(match)
    Rails.cache.delete("player-points-by-match-#{match.id}-#{id}")
  end

  def points_by_season(season)
    Rails.cache.fetch("player-points-by-season-#{season.id}-#{id}") do
      points = 0
      season.rounds.each do |round|
        round.matches.each do |match|
          points += points_by_match(match)
        end
      end
      points
    end
  end

  def clear_points_by_season_cache(season)
    Rails.cache.delete("player-points-by-match-#{season.id}-#{id}")
  end
end

# a = <initial>
# arr.each { |elem| a <operator>= elem.method }
# a

# arr.map { |elem| elem.method }.inject(<initial>, :<operator>)

# Ejemplo final

# def points_by_season(season)
#   teams.by_season(season) # ActiveRecordCollection<Team>
#   teams.by_season(season).map(&:points) # array<integer> [0, 1, 3, 1, 0, 3]
#   teams.by_season(season).map(&:points).inject(0, :+)
# end
