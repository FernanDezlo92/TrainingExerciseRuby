# frozen_string_literal: true

require "rails_helper"

RSpec.describe Match do
  subject { match }

  let(:match) { build(:match) }

  it { is_expected.to be_valid }
end
