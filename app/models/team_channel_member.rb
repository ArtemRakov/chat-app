class TeamChannelMember < ApplicationRecord
  belongs_to :user
  belongs_to :team_channel
end
