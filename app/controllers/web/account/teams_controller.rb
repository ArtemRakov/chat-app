# frozen_string_literal: true

class Web::Account::TeamsController < Web::Account::ApplicationController
  def index
    @teams = current_user.teams
  end

  def new
    @team = current_user.teams.build
  end

  def create
    @team = TeamMutator.create(team_params, current_user)

    if @team.persisted?
      redirect_to account_teams_path
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :slug)
  end
end
