# frozen_string_literal: true

require "rails_helper"

RSpec.describe Player do
  subject { player }

  let(:player) { build(:player) }

  it { is_expected.to be_valid }
end
