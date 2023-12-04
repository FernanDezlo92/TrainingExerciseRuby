# frozen_string_literal: true

shared_examples "with start and end date" do
  let(:start_date) { Time.zone.now }

  context "when date is higher" do
    let(:end_date) { start_date + 1.day }

    it { is_expected.to be_valid }
  end

  context "when date is lower" do
    let(:end_date) { start_date - 1.day }

    it { is_expected.not_to be_valid }
  end

  context "when date is equal" do
    let(:end_date) { start_date }

    it { is_expected.to be_valid }
  end
end
