class WaypointJob < ActiveJob::Base
  # Set the Queue as Default
  queue_as :default

  def perform(waypoint, vehicle)
    Waypoint.load_map(waypoint,vehicle)
  end
end
  