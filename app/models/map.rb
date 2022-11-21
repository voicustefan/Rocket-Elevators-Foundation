class Map < ApplicationRecord
    belongs_to:address, class_name: 'Address', foreign_key: 'location_of_building', optional: true
    belongs_to:address, class_name: 'Address', foreign_key: 'long', optional: true
    belongs_to:address, class_name: 'Address', foreign_key: 'lat', optional: true
    belongs_to:column, class_name: 'Column', foreign_key: 'number_of_floors', optional: true
    belongs_to:customer, class_name: 'Customer', foreign_key: 'client_name', optional: true
    belongs_to:building, class_name: 'Building', foreign_key: 'full_name_of_technical_contact', optional: true
end
