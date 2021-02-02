# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
env :PATH, ENV['PATH']
# set :output, "/path/to/my/cron_log.log"
set :output, 'log/cron.log'
set :environment, :development
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 1.days, at: '11:00 pm' do
  runner "ReservationRemindMailer.reservation_email.deliver_now"
end
# Learn more: http://github.com/javan/whenever
