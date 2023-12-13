# frozen_string_literal: true

module HasTeam
  extend ActiveSupport::Concern

  include HasMatch

  included do
    helper_method :current_team

    def current_team
      current_match.teams.find(params[team_param])
    end

    def team_param
      :team_id
    end
  end
end
