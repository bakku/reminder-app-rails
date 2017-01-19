class ReminderMailJob
  @queue = :mailing

  def self.perform(reminder_id)
    reminder = Reminder.find(reminder_id)
    ReminderMailer.reminder_email(reminder: reminder).deliver_now
    Rails.logger.info "sent mail to #{reminder.user.email}"
    reminder.delete
  end
end
