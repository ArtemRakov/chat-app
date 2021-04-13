# frozen_string_literal: true

require 'test_helper'

class Api::ChannelsControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in_as(:one)
  end

  test 'show' do
    channel = team_channels(:one)

    get channel_path(channel)
    assert_response :success
  end
end
