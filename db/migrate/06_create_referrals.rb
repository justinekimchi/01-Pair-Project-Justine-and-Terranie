class CreateReferrals < ActiveRecord::Migration[5.2]
  def change
    create_table :referrals do |t|
      t.string :existing_customer_name
      t.integer :new_customer_id
    end
  end
end