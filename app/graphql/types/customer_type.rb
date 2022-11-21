# # frozen_string_literal: true

module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :customer_creation_date, GraphQL::Types::ISO8601Date
    field :user_id, Integer
    field :address_id, Integer
    field :company_name, String
    field :full_name_of_company_contact, String
    field :company_contact_phone, String
    field :email_of_company_contact, String
    field :company_description, String
    field :full_name_of_service_technical_authority, String
    field :technical_authority_phone_for_service, String
    field :technical_manager_email_for_service, String
    # field :upload, Types::BinaryType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
