class Api::V1::Gps::VehiclesController < ApplicationController
    def show
        @waypoints = Waypoint.all
        @hash = Gmaps4rails.build_markers(@waypoints) do |waypoint, marker|
            marker.lat waypoint.latitude
            marker.lng waypoint.longitude
        end
    end
end
