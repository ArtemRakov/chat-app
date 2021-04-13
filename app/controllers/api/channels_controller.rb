# frozen_string_literal: true

class Api::ChannelsController < Api::ApplicationController
  def show
    @channel = Team::Channel.find(params[:id])
    @messages = @channel.messages.includes(:user)
  end
end
