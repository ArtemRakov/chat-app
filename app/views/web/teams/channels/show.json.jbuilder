# frozen_string_literal: true

json.channel @channel
json.channels resource_team.channels
json.messages @messages.each do |message|
  json.partial! 'shared/message', as: :message
end
