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
        @waypoint = Waypoint.new(waypoint_params)
        @waypoint.vehicle_id = @vehicle.id
        if @waypoint.save
            render plain: :ok, status: 201
        else
            render json: { error: command.message },
            status: command.error_code
        end       
    end 

    private

    def set_vehicle
        @vehicle = Vehicle.find_or_create_by(vehicle_identifier: params[:vehicle_identifier])
    end

    def waypoint_params
        params.require(:waypoint).permit(:latitude,:longitude,:sent_at,:vehicle_identifier)
    end
end
