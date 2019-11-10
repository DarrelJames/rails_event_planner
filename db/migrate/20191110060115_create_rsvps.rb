class CreateRsvps < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvps do |t|
      t.references :event, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true
      t.boolean :response

      t.timestamps
    end
  end
end
