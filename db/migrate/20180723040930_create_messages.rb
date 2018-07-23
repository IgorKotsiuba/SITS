class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :text, null: false
      t.integer :author_id
      t.references :ticket, foreign_key: true

      t.timestamps
    end

    add_foreign_key :messages, :managers, column: :author_id
  end
end
