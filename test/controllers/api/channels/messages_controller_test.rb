# frozen_string_literal: true

require 'test_helper'

class Api::Channels::MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in_as(:one)
  end

  test 'create' do
    channel = team_channels(:one)
    message_params = FactoryBot.attributes_for('team/channel/message')
    post channel_messages_path(channel), params: { team_channel_message: message_params }
    assert_response :success

    message = Team::Channel::Message.find_by(content: message_params[:content])

    assert { message }
  end

  test 'update' do
    channel = team_channels(:one)
    message = team_channel_messages(:one)
    message_params = FactoryBot.attributes_for('team/channel/message')

    patch channel_message_path(channel, message), params: { team_channel_message: message_params }
    assert_response :success

    message.reload
    assert { message.content == message_params[:content] }
  end

  test 'destroy' do
    channel = team_channels(:one)
    message = team_channel_messages(:one)

    delete channel_message_path(channel, message)
    assert_response :success

    assert { !Team::Channel::Message.find_by(id: message.id) }
  end
end
