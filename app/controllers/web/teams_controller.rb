# frozen_string_literal: true

class Web::TeamsController < Web::ApplicationController
  def index
    @teams = Team.all
  end
end
