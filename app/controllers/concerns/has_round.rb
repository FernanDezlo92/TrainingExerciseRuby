# frozen_string_literal: true

module HasRound
  extend ActiveSupport::Concern

  include HasSeason

  included do
    helper_method :current_round

    def current_round
      current_season.rounds.find(params[round_param])
    end

    def round_param
      :round_id
    end
  end
end
