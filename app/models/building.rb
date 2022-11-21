class Building < ApplicationRecord
    belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id', optional: true
    has_one :battery, class_name: 'Battery', foreign_key: 'building_id'
    has_one :building_detail, class_name: 'Building_detail', foreign_key: 'building_id'
    belongs_to :address, class_name: 'Address', foreign_key: 'address_id', optional: true
    has_one :map, class_name: 'Map', foreign_key: 'full_name_of_technical_contact'
    def self.map_data
        data = {}
        Building.all.each do |building|
          coordinates = coords(building)
          details_of_address = info(building)
          data[building.id] = {info: details_of_address, coordinates: coordinates}
        end
        return data
      end 
    end
    def addresses_array
      address = JSON.parse(File.read("./db/addresses.json"))
      addresses_list = address["addresses"]
      address_hash = {}
      addresses_list.each do |address|
        address_hash[address["address1"]] = {lat: address["coordinates"]["lat"], lng: address["coordinates"]["lng"]}
      end
      return address_hash
    end
    def coords(building)
      address_hash = addresses_array()
      address = Address.find(building.id)
      lat = address_hash[address.number_and_street][:lat]
      lng = address_hash[address.number_and_street][:lng]
      return {lat: lat, lng: lng}
    end 
    def info(building)  
      address = Address.find(building.id)
      client = User.find(Customer.find(building.customer_id).user_id)
      details = '<div id="content">' +
                '<div id="siteNotice"></div>' + 
                  "<ul>"+
                    "<li> #{"Address: #{address.number_and_street}"} </li>" +
                    "<li> #{"Client Name: #{client.first_name} #{client.last_name}"} </li>" +
                    "<li> #{"Number Of Floors: 10"} </li>" +
                    "<li> #{"Number Of Columns: 1 "} </li>" +
                    "<li> #{"Number Of Elevators: 1 "} </li>" +
                    "<li> #{"Technical Contact Name: #{building.full_name_of_the_technical_contact_for_the_building}"} </li>" +
                  "</ul>" +
                "</div>" +
              "</div>"
      return details
end
