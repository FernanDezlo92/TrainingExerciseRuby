# frozen_string_literal: true

FactoryBot.define do
  factory :season do
    name { Faker::Name.first_name }
    start_date { Faker::Date.between(from: Time.zone.now, to: 1.year.from_now) }
    end_date { start_date + 6.months }
    organization { association(:organization) }
  end
end
