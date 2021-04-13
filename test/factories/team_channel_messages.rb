# frozen_string_literal: true

FactoryBot.define do
  factory 'team/channel/message' do
    sequence(:content) { |n| "Content-#{n}" }
  end
end
