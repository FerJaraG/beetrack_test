class Api::V1::Gps::VehiclesController < ApplicationController
    def show
        #aqui se construyen los marcadores del mapa con la información de la BD
        @waypoints = Waypoint.joins(:vehicle).where("waypoints.created_at = (select MAX(w1.created_at) from waypoints w1 where w1.vehicle_id = vehicles.id)").select("waypoints.vehicle_id, waypoints.id, waypoints.created_at, waypoints.latitude, waypoints.longitude")

        @hash = Gmaps4rails.build_markers(@waypoints) do |waypoint, marker|
            marker.lat waypoint.latitude
            marker.lng waypoint.longitude
            marker.infowindow waypoint.vehicle.vehicle_identifier
        end
    end
end
