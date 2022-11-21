# # frozen_string_literal: true

module Types
  class BatteryType < Types::BaseObject
    field :id, ID, null: false
    field :building_id, Integer
    field :buildingType, String
    field :status, String
    field :employeeId, Integer
    field :dateofcomissioning, GraphQL::Types::ISO8601DateTime
    field :dateoflastinspection, GraphQL::Types::ISO8601DateTime
    field :certificationofops, String
    field :information, String
    field :notes, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
