# frozen_string_literal: true

class SeasonController < ApplicationController
  include HasOrganization
  include HasSeason

  before_action :authenticate_user!

  def index
    @organization = current_organization
    @seasons = @organization.seasons
    @non_active_seasons = @organization.seasons.nonactive
  end

  def show
    @season = current_season
    @organization = current_organization
    @users = @organization.users
    @seasons = @organization.seasons.active
    @rounds = @season.rounds.active
    @players = @organization.players
  end

  private

  def season_param
    :id
  end
end
