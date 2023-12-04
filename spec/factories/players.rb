# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    admin { false }
    organization { association(:organization) }
    user { association(:user) }
    trait :admin do
      admin { true }
    end
  end
end
