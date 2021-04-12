# frozen_string_literal: true

class TeamMutator
  def self.create(params, user)
    team = user.owned_teams.build(params)

    if team.save
      team.members.create!(user: user)
      channel = team.channels.create!(slug: Team::Channel::DEFAULT)
      channel.members.create!(user: user, team: team)
    end

    team
  end
end
