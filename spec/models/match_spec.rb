# frozen_string_literal: true

require "rails_helper"

RSpec.describe Match do
  subject { match }

  let(:match) { build(:match) }

  it { is_expected.to be_valid }

  describe "team for player" do
    context "with match with teams players" do
      let(:match) { create(:match) }
      let(:team_first) { create(:team, match:) }
      let(:team_second) { create(:team, match:) }
      let(:team_first_players) { create_list(:team_player, 5, team: team_first) }
      let(:team_second_players) { create_list(:team_player, 5, team: team_second) }

      it "returns the correct team" do
        team_first_players.each do |player|
          expect(match.team_for_player(player)).not_to eq(team_second)
          expect(match.team_for_player(player)).to eq(team_first)
        end
      end
    end
  end
end
