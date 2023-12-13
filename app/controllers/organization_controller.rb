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

  private

  def organization_param
    :id
  end
end
