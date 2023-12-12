# frozen_string_literal: true

class RoundController < ApplicationController
  before_action :authenticate_user!

  def index
    @season = Season.find(params[:id])
    @rounds = @season.rounds
  end

  def show
    @round = Round.find(params[:id])
    @season = @round.season
    @organization = @season.organization
    @users = @organization.users
    @seasons = @organization.seasons.active
    @matches = @round.matches
    @teams = @round.teams
  end
end
