# frozen_string_literal: true

require "rails_helper"

RSpec.describe TeamPlayer do
  subject { team_player }

  let(:team_player) { build(:team_player) }

  it { is_expected.to be_valid }

  describe "same organization" do
    let(:team_player) { create(:team_player) }

    it "creates only one organization" do
      expect { subject }.to change(Organization, :count).by(1)
      expect(subject.player.organization).to be(subject.team.organization)
    end
  end

  describe "check_player_in_opponent" do
    let(:match) { create(:match) }
    let(:team) { create(:team, match:) }
    let(:player) { create(:player, organization: match.organization) }
    let(:team_player) { build(:team_player, team:, player:) }

    context "when team has not opponent" do
      it { is_expected.to be_valid }
    end

    context "when team has opponent" do
      let!(:opponent_team) { create(:team, match:) }

      context "when opponent does not have the same player" do
        it { is_expected.to be_valid }
      end

      context "when opponent has the same player" do
        before do
          create(:team_player, team: opponent_team, player:)
        end

        it { is_expected.not_to be_valid }
      end
    end
  end
end
