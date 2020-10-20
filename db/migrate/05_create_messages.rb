class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :guest_name
      t.integer :guest_phone_number
      t.string :message
    end
  end
end