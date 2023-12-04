# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { Faker::Name.first_name }
    color { Faker::Color.color_name}
    match { association(:match) }
  end
end
