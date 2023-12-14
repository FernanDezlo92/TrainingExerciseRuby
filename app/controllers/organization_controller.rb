# frozen_string_literal: true

class OrganizationController < ApplicationController
  include HasOrganization

  before_action :authenticate_user!

  def index
    @organizations = Organization.all
  end

  def show
    @organization = current_organization
    @users = @organization.users
    @seasons = @organization.seasons.active
  end

  def new
    @organization = Organization.new
    @users = @organization.users
    @players = @organization.players
  end

  def create
    @organization = Organization.new(params.require(:organization).permit(:name, :logo))
    @player = @organization.players.new(user_id: current_user.id, admin: true)

    ActiveRecord::Base.transaction do
      @organization.save!
      @player.save!
    rescue ActiveRecord::StatementInvalid
      render :new
    end
    redirect_to organization_index_path(@organization), notice: "organization was successfully created."
  end

  private

  def organization_param
    :id
  end
end
