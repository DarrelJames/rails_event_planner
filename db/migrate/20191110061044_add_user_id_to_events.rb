class AddUserIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user
  end
end
