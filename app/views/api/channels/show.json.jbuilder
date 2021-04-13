# frozen_string_literal: true

json.channel @channel
json.messages @messages.each do |message|
  json.partial! 'shared/message', message: message
end
