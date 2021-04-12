# frozen_string_literal: true

class Api::Channels::ApplicationController < Api::ApplicationController
  before_action :authenticate_user!
  helper_method :resource_channel

  def resource_channel
    @resource_channel ||= Team::Channel.find(params[:channel_id])
  end
end
