class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :start_time
      t.string :end_time
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
