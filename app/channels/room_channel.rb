class RoomChannel < ApplicationCable::Channel
  identified_by :current_user
  def subscribed
     stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)

    #ActionCable.server.broadcast 'room_channel', data['message']
    Message.create content: data['message'] ,team_id: data['team_id'], user_id: current_user.id
    debugger
  end
end
