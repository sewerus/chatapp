class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create! content: data["message"], user: current_user
    ActionCable.server.broadcast "room_channel", message: message
  end
end
