# frozen_string_literal: true

class OrganizationController < ApplicationController
  before_action :authenticate_user!

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
    @users = @organization.users
    @seasons = @organization.seasons.active
  end
end
