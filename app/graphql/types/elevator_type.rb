# # frozen_string_literal: true

module Types
  class ElevatorType < Types::BaseObject
    field :id, ID, null: false
    field :column_id, Integer
    field :serialNumber, String
    field :model, String
    field :elevatorType, String
    field :status, String
    field :commissioningDate, GraphQL::Types::ISO8601DateTime
    field :lastInspection, GraphQL::Types::ISO8601DateTime
    field :inspectionCertificate, String
    field :information, String
    field :notes, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
