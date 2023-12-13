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
      redirect_to organization_season_round_path(@organization, @season, @round), notice: "Team was successfully updated."
    else
      render :edit
    end
  end

  private

  def team_param
    :id
  end
end
