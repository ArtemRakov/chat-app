class Team::Channel::Member < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :channel, class_name: "Team::Channel"
end
