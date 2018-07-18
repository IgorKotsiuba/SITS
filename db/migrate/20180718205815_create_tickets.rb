class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :customer_name, null: false
      t.string :customer_email, null: false
      t.integer :department_id, null: false
      t.string :subject, null: false
      t.text :body, null: false
      t.string :reference_uuid, null: false
      t.integer :owner_id

      t.timestamps
    end

    add_index :tickets, :reference_uuid, unique: true
    add_foreign_key :tickets, :managers, column: :owner_id
  end
end
