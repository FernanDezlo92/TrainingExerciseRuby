# frozen_string_literal: true

require "rails_helper"

RSpec.describe Round do
  subject { round }

  let(:round) { build(:round) }

  it { is_expected.to be_valid }

  describe "date compare" do
    let(:round) { build(:round, start_date:, end_date:) }

    include_examples "with start and end date"
  end
end
