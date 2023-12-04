# frozen_string_literal: true

module WithStartAndEndDate
  extend ActiveSupport::Concern

  included do
    validates :start_date, comparison: { less_than_or_equal_to: :end_date }
  end
end
