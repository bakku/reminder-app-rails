class RemoveAndRenameColumnsOfReminder < ActiveRecord::Migration[5.0]
  def change
    remove_column :reminders, :title
    rename_column :reminders, :text, :message
    rename_column :reminders, :date_of_issue, :reminder_date
  end
end
