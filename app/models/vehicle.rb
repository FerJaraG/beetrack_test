class Vehicle < ApplicationRecord
    has_many :waypoints 
    validates :vehicle_identifier, uniqueness: true
end
