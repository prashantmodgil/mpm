class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel#{message.team_id}", message: render_message(message)
  end
  private
  def render_message(message)
    #ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message}
      ApplicationController.renderer.render message
  end
end
