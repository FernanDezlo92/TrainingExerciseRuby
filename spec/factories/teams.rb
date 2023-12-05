# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { Faker::Name.first_name }
    color { Faker::Color.color_name }
    score { Faker::Number.between(from: 0, to: 5) }
    match { association(:match) }
  end
end
