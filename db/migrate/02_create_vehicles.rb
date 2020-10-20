class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :customer_id
      t.string :vehicle_type
    end
  end

end