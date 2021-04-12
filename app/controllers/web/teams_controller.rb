# frozen_string_literal: true

class Web::TeamsController < Web::ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])

    redirect_to team_channel_path(@team, @team.channels.first)
  end
end
