class WaypointChannel < ApplicationCable::Channel
  def subscribed
    stream_from "waypoint_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
