# frozen_string_literal: true

class Api::Channels::MessagesController < Api::Channels::ApplicationController
  def create
    @message = resource_channel.messages.build(message_params.merge(user: current_user, team: resource_channel.team))

    if @message.save
      render json: @message, status: :created
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  def update
    @message = current_user.messages.find(params[:id])

    if @message.update(message_params)
      render json: @message, status: :ok
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  def destroy
    @message = current_user.messages.find(params[:id])

    if @message.destroy
      render json: @message, status: :ok
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:team_channel_message).permit(:content)
  end
end
