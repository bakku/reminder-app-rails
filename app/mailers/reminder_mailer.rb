class ReminderMailer < ApplicationMailer
  def reminder_email(reminder:)
    @message = reminder.message 
    mail(to: reminder.user.email, subject: 'Your Reminder')
  end
end
