class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :Author
      t.string :CustomerID
      t.string :BuildingID
      t.string :BatteryID
      t.string :ColumnID
      t.string :ElevatorID
      t.string :EmployeeID
      t.string :StartDate
      t.string :EndDate
      t.string :Result
      t.string :Report
      t.string :Status

      t.timestamps
    end
  end
end
