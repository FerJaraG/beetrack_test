class WaypointJob < ActiveJob::Base
  # Set the Queue as Default
  queue_as :default

  # rescue_from(ErrorLoadingSite) do
  #   retry_job wait: 1.minutes, queue: :low_priority 
  # end 

  def perform(waypoint, vehicle)
    waypoint = Waypoint.new(waypoint)
    waypoint.vehicle_id = vehicle.id
    waypoint.save
  end
end
  