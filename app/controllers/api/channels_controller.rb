# frozen_string_literal: true

class Api::ChannelsController < Api::ApplicationController
  def show
    @channel = Team::Channel.find(params[:id])
  end
end
