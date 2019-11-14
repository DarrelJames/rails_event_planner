class AddUserIdToFaqs < ActiveRecord::Migration[6.0]
  def change
    add_reference :faqs, :user, foreign_key: true
  end
end
