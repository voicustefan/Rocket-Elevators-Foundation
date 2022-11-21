# frozen_string_literal: true

module Types
  class ColumnType < Types::BaseObject
    field :id, ID, null: false
    field :battery_id, Integer
    field :Type, String
    field :number_of_floors_served, String
    field :Status, String
    field :Information, String
    field :Notes, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
