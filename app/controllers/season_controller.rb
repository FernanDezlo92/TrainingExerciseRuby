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

  def new
    @organization = current_organization
    @season = @organization.seasons.new
    @users = @organization.users
    @players = @organization.players
  end

  def create
    @users = current_user
    @organization = current_organization
    @seasons = @organization.seasons.new(params.require(:season).permit(:name, :start_date, :end_date))

    ActiveRecord::Base.transaction do
      @season.save!
    rescue ActiveRecord::StatementInvalid
      render :new
    end
    redirect_to organization_season_index_path(@organization), notice: "Season was successfully created."
  end

  private

  def season_param
    :id
  end
end
