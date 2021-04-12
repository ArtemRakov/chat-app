# frozen_string_literal: true

require 'test_helper'

class Web::Teams::ChannelsControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in_as(:one)
  end

  test 'show' do
    team = teams(:one)
    channel = team_channels(:one)

    get team_channel_path(team, channel)
    assert_response :success
  end

  test 'new' do
    team = teams(:one)
    get new_team_channel_path(team)
    assert_response :success
  end

  test 'create' do
    team = teams(:one)
    channel_params = FactoryBot.attributes_for('team/channel')

    post team_channels_path(team), params: { team_channel: channel_params }

    assert { Team::Channel.find_by(team: team, slug: channel_params[:slug]) }
  end
end
