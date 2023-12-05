# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    start_time { Faker::Date.between(from: Time.zone.now, to: 1.year.from_now) }
    end_time { start_time + 1.hour }
    round { association(:round) }
  end
end
