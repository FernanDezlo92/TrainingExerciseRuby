# frozen_string_literal: true

class SeasonController < ApplicationController
  before_action :authenticate_user!

  def index
    @organization = Organization.find(params[:id])
    @seasons = @organization.seasons
    @non_active_seasons = @organization.seasons.nonactive
  end

  def show
    @season = Season.find(params[:id])
    @organization = @season.organization
    @users = @organization.users
    @seasons = @organization.seasons.active
    @rounds = @season.rounds.active
    @players = @organization.players
  end
end
