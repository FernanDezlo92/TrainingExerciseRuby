# frozen_string_literal: true

class TeamController < ApplicationController
  include HasOrganization
  include HasSeason
  include HasRound
  include HasMatch
  include HasTeam

  before_action :authenticate_user!

  def edit
    @team = current_team
  end

  def update
    @team = current_team
    @round = current_round
    @season = current_season
    @organization = current_organization
    @users = @organization.users
    @matches = @round.matches
    @teams = @round.teams

    if @team.update(params.require(:team).permit(:score))
      clear_player_points_cache(current_user, @team.match)

      redirect_to organization_season_round_path(@organization, @season, @round), notice: "Team was successfully updated."
    else
      render :edit
    end
  end

  def clear_player_points_cache(player, match)
    cache_key = "player-points-by-match-#{match.id}-#{player.id}"
    Rails.cache.delete(cache_key)
  end

  private

  def team_param
    :id
  end
end
