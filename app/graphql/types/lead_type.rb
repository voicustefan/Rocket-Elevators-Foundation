# # frozen_string_literal: true

module Types
  class LeadType < Types::BaseObject
    field :id, ID, null: false
    field :full_name, String
    field :company_name, String
    field :email, String
    field :phone, String
    field :project_name, String
    field :project_description, String
    field :department, String
    field :message, String
    # field :attached_file, Types::BinaryType
    # field :image, Types::BinaryType
    field :date, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
