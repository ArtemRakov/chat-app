# frozen_string_literal: true

class Web::Teams::ApplicationController < Web::ApplicationController
  before_action :authenticate_user!

  helper_method :resource_team

  def resource_team
    @resource_team ||= Team.find(params[:team_id])
  end
end
