require "rufus-scheduler"

scheduler = Rufus::Scheduler::singleton

scheduler.cron "00 17 * * *" do
  Course.start.each do |course|
    course.send_trainees_report_to_trainer
  end
end

