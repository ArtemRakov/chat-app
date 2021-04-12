# frozen_string_literal: true

class Team::Channel::Message < ApplicationRecord
  belongs_to :channel
  belongs_to :team
  belongs_to :user
end
