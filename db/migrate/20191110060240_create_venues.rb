class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code

      t.timestamps
    end
  end
end