# # frozen_string_literal: true

module Types
  class QuoteType < Types::BaseObject
    field :id, ID, null: false
    field :buildingType, String
    field :residential_apartment, Integer
    field :residential_floor, Integer
    field :residential_basement, Integer
    field :commercial_business, Integer
    field :commercial_floor, Integer
    field :commercial_basement, Integer
    field :commercial_parking, Integer
    field :commercial_cage, Integer
    field :corporate_companie, Integer
    field :corporate_floor, Integer
    field :corporate_basement, Integer
    field :corporate_parking, Integer
    field :corporate_occupant, Integer
    field :hybrid_business, Integer
    field :hybrid_floor, Integer
    field :hybrid_basement, Integer
    field :hybrid_parking, Integer
    field :hybrid_occupant, Integer
    field :hybrid_hour, Integer
    field :cage_amount, Integer
    field :QualityType, String
    field :price_elevator, Integer
    field :total_price, Integer
    field :installation_fees, Integer
    field :final_price, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
