class Api::V1::Gps::WaypointsController < ActionController::API
    before_action :set_vehicle

    def show
        render json:{
            latitude: @vehicle.waypoints.last.latitude,
            longitude: @vehicle.waypoints.last.longitude,
            sent_at: @vehicle.waypoints.last.created_at,
            vehicle_identifier: @vehicle.vehicle_identifier
        }
    end

    def create
        WaypointJob.perform_later(waypoint_params.to_hash,@vehicle)  
        render plain: :ok, status: 201
    end 

    private

    def set_vehicle
        @vehicle = Vehicle.find_or_create_by(vehicle_identifier: params[:vehicle_identifier])
    end

    def waypoint_params
        params.require(:waypoint).permit(:latitude,:longitude,:sent_at,:vehicle_identifier)
    end
end
