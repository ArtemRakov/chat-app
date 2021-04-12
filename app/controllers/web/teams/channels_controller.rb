# frozen_string_literal: true

class Web::Teams::ChannelsController < Web::Teams::ApplicationController
  def show
    @channel = resource_team.channels.find(params[:id])

    gon.messages = @channel.messages
    gon.user = current_user
    gon.channel = @channel
    gon.channels = resource_team.channels
  end

  def new
    @channel = resource_team.channels.build
  end

  def create
    @channel = resource_team.channels.build(channel_params)

    if @channel.save
      @channel.members.create!(team: resource_team, user: current_user)
      redirect_to team_channel_path(resource_team, @channel)
    else
      render :new
    end
  end

  private

  def channel_params
    params.require(:team_channel).permit(:slug)
  end
end
