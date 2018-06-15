class Waypoint < ApplicationRecord
  belongs_to :vehicle
  
  def self.load_map(waypoint, vehicle)
    waypoint = new(waypoint)
    waypoint.vehicle_id = vehicle.id
    waypoint.save

    waypoints = joins(:vehicle).where("waypoints.created_at = (select MAX(w1.created_at) from waypoints w1 where w1.vehicle_id = vehicles.id)").select("waypoints.vehicle_id, waypoints.id, waypoints.created_at, waypoints.latitude, waypoints.longitude")

    hash = Gmaps4rails.build_markers(waypoints) do |waypoint, marker|
        marker.lat waypoint.latitude
        marker.lng waypoint.longitude
        marker.infowindow waypoint.vehicle.vehicle_identifier
    end

    html = ApplicationController.render partial: 'api/v1/gps/vehicles/map', locals: { hash: hash}, formats: :html
    ActionCable.server.broadcast 'waypoint_channel', hash: hash
  end
  
end
