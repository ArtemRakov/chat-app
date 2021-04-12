# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    sequence(:slug) { |n| "Team-#{n}" }
    sequence(:name) { |n| "Team-#{n}" }
  end
end
