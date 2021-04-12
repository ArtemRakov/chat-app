# frozen_string_literal: true

class Web::Teams::ChannelsController < Web::Teams::ApplicationController
  def index
    @channels = avaliable_channels
    @channels_to_discover = resource_team.channels.where.not(id: @channels)
  end

  def show
    @channel = resource_team.channels.find_by!(slug: params[:id])
    @channels = avaliable_channels

    # @messages = @channel.messages.as_json(include: :user)
    # @user = current_user.attributes.merge(guest: resource_team.guest?(current_user))

    gon.messages = @channel.messages
    gon.user = current_user
    gon.channel_guest = resource_team.guest?(current_user)
  end

  def new
    @channel = resource_team.channels.build
  end

  def create
    @channel = resource_team.channels.build(channel_params)

    if @channel.save
      @channel.members.create!(team: resource_team, user: current_user)
      redirect_to team_channel_path(resource_team.slug, @channel)
    else
      render :new
    end
  end

  private

  # i am just a bit lazy but it is better to move this logic to policy (maybe use gem like pundit)
  def avaliable_channels
    if resource_team.guest?(current_user)
      resource_team.channels.where(name: Team::Channel::DEFAULT)
    else
      current_user.channels.where(team: resource_team)
    end
  end

  def channel_params
    params.require(:team_channel).permit(:slug)
  end
end
