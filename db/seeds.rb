# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Vehicle.create(vehicle_identifier: "LF9421")
Vehicle.create(vehicle_identifier: "BTHK72")
Vehicle.create(vehicle_identifier: "RR8810")

Waypoint.create(latitude:-33.439068, longitude: -70.618348, vehicle_id: 1)
Waypoint.create(latitude:-33.438625, longitude: -70.618490, vehicle_id: 1)
Waypoint.create(latitude:-33.437906, longitude: -70.618641, vehicle_id: 1)


