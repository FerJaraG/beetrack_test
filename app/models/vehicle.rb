class Vehicle < ApplicationRecord
    has_many :waypoints 
    validates :vehicle_identifier, presence: :true, uniqueness: true
end
