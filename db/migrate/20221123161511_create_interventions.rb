class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :author
      t.string :customerID
      t.string :buildingID
      t.string :batteryID
      t.string :columnID
      t.string :elevatorID
      t.string :employeeID
      t.integer :startDate
      t.integer :endDate
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end
