class Column < ApplicationRecord
    belongs_to :battery, class_name:'Battery', foreign_key: 'battery_id', optional: true
    has_many :elevator, class_name:'Elevator', foreign_key: 'column_id'
    has_one :map, class_name: 'Map', foreign_key: 'number_of_floors'

    # belongs_to :battery

    # has_many :elevators
end
