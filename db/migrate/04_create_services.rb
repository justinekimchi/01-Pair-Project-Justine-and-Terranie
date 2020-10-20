class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :vehicle_id
      t.integer :package_id
      t.timestamp
    end
  end
end