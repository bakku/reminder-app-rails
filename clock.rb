require_relative 'config/environment'

task = Concurrent::TimerTask.new(execution_interval: 1) do 
  reminders = Reminder.all

  reminders.each do |r|
    if r.reminder_date < DateTime.now
      puts 'due!'
    end
  end
end

task.execute

while 1
  sleep 1
end
