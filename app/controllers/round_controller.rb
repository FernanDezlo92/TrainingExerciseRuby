# frozen_string_literal: true

class RoundController < ApplicationController
  include HasOrganization
  include HasSeason
  include HasRound

  before_action :authenticate_user!

  def index
    @rounds = current_season.rounds
  end

  def show
    @round = current_round
    @season = current_season
    @organization = current_organization
    @users = @organization.users
    @seasons = @organization.seasons.active
    @matches = @round.matches
    @teams = @round.teams
  end

  private

  def round_param
    :id
  end
end
