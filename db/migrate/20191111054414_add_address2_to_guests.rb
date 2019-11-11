class AddAddress2ToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :address2, :string
  end
end
