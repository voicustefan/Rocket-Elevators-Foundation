class Intervention < ApplicationRecord
belongs_to  :elevator, class_name: 'Elevator', foreign_key: 'elevator_id', optional: true
belongs_to  :battery, class_name: 'Battery', foreign_key: 'battery_id', optional: true
belongs_to  :column, class_name: 'Column', foreign_key: 'column_id', optional: true
belongs_to  :employee, class_name: 'Employee', foreign_key: 'employee_id', optional: true
belongs_to  :building, class_name: 'Building', foreign_key: 'building_id', optional: true
belongs_to  :customer, class_name: 'Customer', foreign_key: 'customer_id', optional: true
end
