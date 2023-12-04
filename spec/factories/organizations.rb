# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name { Faker::Name.first_name }
    trait :with_admin do
      after :create do |organization|
        create(:player, :admin, organization:)
      end
    end
  end
end
