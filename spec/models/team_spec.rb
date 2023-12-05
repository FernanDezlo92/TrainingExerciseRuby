# frozen_string_literal: true

require "rails_helper"

RSpec.describe Team do
  subject { team }

  let(:team) { build(:team) }

  it { is_expected.to be_valid }

  describe "team_vs" do
    let(:match) { create(:match) }
    let!(:team) { create(:team, match:) }
    let!(:other_team) { create(:team, match:) }

    it "returns the rival team" do
      expect(team.team_vs).to eq(other_team)
      expect(other_team.team_vs).to eq(team)
    end
  end
end
