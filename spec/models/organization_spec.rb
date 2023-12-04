# frozen_string_literal: true

require "rails_helper"

RSpec.describe Organization do
  subject { organization }

  let(:organization) { build(:organization) }

  it { is_expected.to be_valid }
end
