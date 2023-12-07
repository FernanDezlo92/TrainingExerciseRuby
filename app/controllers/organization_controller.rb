# frozen_string_literal: true

class OrganizationController < ApplicationController
  before_action :authenticate_user!

  def index
    @organizations = Organization.all
  end
end
