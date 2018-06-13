class Api::V1::Gps::WaypointsController < ApplicationController
    before_action :set_vehicle

    def show
        render json:{
            latitude: @vehicle.waypoints.last.latitude,
            longitude: @vehicle.waypoints.last.longitude,
            sent_at: @vehicle.waypoints.last.created_at,
            vehicle_identifier: @vehicle.vehicle_identifier
        }
    end

    private

    def set_vehicle
        @vehicle = Vehicle.find(params[:id])
    end
end
