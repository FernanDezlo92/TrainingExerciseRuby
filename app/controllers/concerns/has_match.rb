# frozen_string_literal: true

module HasMatch
  extend ActiveSupport::Concern

  include HasRound

  included do
    helper_method :current_match

    def current_match
      current_round.matches.find(params[match_param])
    end

    def match_param
      :match_id
    end
  end
end
