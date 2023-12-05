# frozen_string_literal: true

require "rails_helper"

RSpec.describe Player do
  subject { player }

  let(:player) { build(:player) }

  it { is_expected.to be_valid }

  describe "pints by match" do
    fixtures :all

    let(:player) { Player.where(user: User.find_by(email: "user1@example.org")).first }
    let(:match) { Match.first }

    it "has players from fixtures" do
      expect(Player.count).to be 12
    end

    context "with first player" do
      it "has 3 points in the first match" do
        expect(player.points_by_match(match)).to eq(1)
      end

      it "has 12 points in the first season" do
        expect(player.points_by_season(match.season)).to eq(5)
      end

      it "has 22 points in the second season" do
        expect(player.points_by_season(match.season)).to eq(0)
      end
    end
  end
end
