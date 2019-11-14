class CreateFaqs < ActiveRecord::Migration[6.0]
  def change
    create_table :faqs do |t|
      t.string :question
      t.string :answer
      t.belongs_to :event
      t.timestamps
    end
  end
end
