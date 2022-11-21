class Address < ApplicationRecord
    # has_one :customer, class_name: 'Customer', foreign_key: 'address_id'
    has_one :customer, class_name: 'Customer', foreign_key: 'address_id'
    has_one :building, class_name: 'Building', foreign_key: 'customer_id' 
    has_one :map, class_name: 'Map', foreign_key: 'location_of_building'
    has_one :map, class_name: 'Map', foreign_key: 'long'
    has_one :map, class_name: 'Map', foreign_key: 'lat'
end