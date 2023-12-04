# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    result_home { Faker::Number.between(from: 0, to: 5) }
    result_away { Faker::Number.between(from: 0, to: 5) }
    start_time { Faker::Date.between(from: Time.zone.now, to: 1.year.from_now) }
    end_time { start_time + 1.hour }
    round { association(:round) }
  end
end
