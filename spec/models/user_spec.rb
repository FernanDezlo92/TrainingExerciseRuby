# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  subject { user }

  let(:user) { build(:user) }

  it { is_expected.to be_valid }

  describe "admin" do
    it "is false by default" do
      expect(user.admin).to be(false)
    end

    context "when set to true" do
      let(:user) { build(:user, :admin) }

      it "is true" do
        expect(user.admin).to be(true)
      end
    end
  end
end
