class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.text :text
      t.datetime :date_of_issue
      t.integer :user_id

      t.timestamps
    end
  end
end
