# frozen_string_literal: true

require "rails_helper"

RSpec.describe Season do
  subject { season }

  let(:season) { build(:season) }

  it { is_expected.to be_valid }

  describe "date compare" do
    let(:season) { build(:season, start_date:, end_date:) }

    include_examples "with start and end date"
  end
end
