# frozen_string_literal: true

module HasSeason
  extend ActiveSupport::Concern

  include HasOrganization

  included do
    helper_method :current_season

    def current_season
      current_organization.seasons.find(params[season_param])
    end

    def season_param
      :season_id
    end
  end
end
