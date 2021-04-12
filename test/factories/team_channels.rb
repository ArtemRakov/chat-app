# frozen_string_literal: true

FactoryBot.define do
  factory 'team/channel' do
    sequence(:slug) { |n| "Channel-#{n}" }
  end
end
