# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  let(:user) { build(:user) }

  describe "admin" do
    it "is false by default" do
      expect(user.admin).to be(false)
    end

    context "when set to true" do
      let(:user) { build(:user, admin: true) }

      it "is true" do
        expect(user.admin).to be(true)
      end
    end
  end
end
