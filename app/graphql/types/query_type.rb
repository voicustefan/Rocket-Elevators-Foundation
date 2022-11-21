module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: ID!!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :building, Types::BuildingType, null: false do
      argument :id, ID, required: true
    end    
    def building(id:)
      Building.find(id)
    end

    field :address, Types::AddressType, null: false do
      argument :id, ID, required: true
    end    
    def address(id:)
      Address.find(id)
    end

    field :lead, Types::LeadType, null: false do
      argument :id, ID, required: true
    end    
    def lead(id:)
      Lead.find(id)
    end

    field :column, Types::ColumnType, null: false do
      argument :id, ID, required: true
    end    
    def column(id:)
      Column.find(id)
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end


    field :battery, Types::BatteryType, null: false do
      argument :id, ID, required: true
    end   
    def battery(id:)
      Battery.find(id)
    end

    field :customer, Types::CustomerType, null: false do
      argument :id, ID, required: true
    end
    def customer(id:)
      Customer.find(id)
    end

    field :elevator, Types::ElevatorType, null: false do
      argument :id, ID, required: true
    end    
    def elevator(id:)
      Elevator.find(id)
    end

    field :employee, Types::EmployeeType, null: false do
      argument :id, ID, required: true
    end    
    def employee(id:)
      Employee.find(id)
    end


    field :quote, Types::QuoteType, null: false do
      argument :id, ID, required: true
    end    
    def quote(id:)
      Quote.find(id)
    end



    # field :fact_intervention, Types::FactInterventionType, null: false do
    #   argument :buildingid, ID, required: true
    # end    
    # def fact_intervention(buildingid:)
    #   fact_intervention.find(buildingid)
    # end



    field :interventions, [Types::FactInterventionType], null: false
    
    def interventions
      FactIntervention.all
    end




  end
end
