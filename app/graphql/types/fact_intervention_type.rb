module Types
  class FactInterventionType < Types::BaseObject
    field :address, [Types::AddressType], null: true

    field :employee_id, Integer, null: true
    field :buildingid, Integer, null: true
    field :battery_id, Integer, null: true
    field :column_id, Integer, null: true
    field :elevator_id, Integer, null: true
    field :status, String, null: true
    field :result, String, null: true
    field :report, String, null: true
    # field :intervention_start, GraphQL::Types::ISO8601DateTime, null: true
    # field :intervention_finish, GraphQL::Types::ISO8601DateTime, null: true
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    
  end
end