# frozen_string_literal: true

class Web::TeamsController < Web::ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by(slug: params[:id])

    redirect_to team_channel_path(@team, Team::Channel::DEFAULT)
  end
end
