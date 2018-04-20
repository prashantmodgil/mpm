class RoomChannel < ApplicationCable::Channel

  def subscribed
     stream_from "room_channel#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #ActionCable.server.broadcast 'room_channel', data['message']
    Message.create content: data['message'] ,team_id: data['team_id'] ,mem_id: current_user.id
  end
end
