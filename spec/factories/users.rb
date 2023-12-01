# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password { Faker::Internet.password }
    email { Faker::Internet.email }
    admin { false }
    trait :admin do
      admin { true }
    end
  end
end
