# frozen_string_literal: true

json.channel @channel
json.channels resource_team.channels
# rubocop:disable Lint/UnusedBlockArgument
json.messages @messages.each do |message|
  json.partial! 'shared/message', as: :message, current_user: @current_user
end
# rubocop:enable Lint/UnusedBlockArgument
