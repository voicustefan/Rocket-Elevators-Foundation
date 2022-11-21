class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :location_of_building
      t.string :number_of_floors
      t.string :client_name
      t.integer :number_of_batteries
      t.integer :number_of_columns
      t.integer :number_of_elevators
      t.string :full_name_of_technical_contact
      t.decimal :long, :precision => 10, :scale => 6
      t.decimal :lat, :precision => 10, :scale => 6

      t.timestamps
      t.belongs_to :building
      t.belongs_to :address
      t.belongs_to :column
      t.belongs_to :customer
    end
    add_foreign_key :maps, :addresses 
    add_foreign_key :maps, :columns
    add_foreign_key :maps, :customers 
    add_foreign_key :maps, :buildings
  end
end
