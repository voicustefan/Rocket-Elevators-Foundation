# # frozen_string_literal: true

module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :type_of_address, String
    field :status, String
    field :entity, String
    field :number_and_street, String
    field :suite_or_apartment, String
    field :city, String
    field :postal_code, String
    field :country, String
    field :notes, String
    field :long, Float
    field :lat, Float
    field :customer_id, Integer
    field :building_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
