require "rubygems"
require "time_difference"
require "date"
require "mail"
file_path = "/home/ec2-user/EchoMonitors/Log/load_avg.out"
restart_status = false
INSTANCE_IP = "ip-10-95-226-182"
options = {:address => "smtp.timeinc.com", :port => 25, :domain => 'timeinc.com'}
Mail.defaults do
  delivery_method :smtp, options
end

mail = Mail.new do
  to 'beep-ecommerce@timeinc.net,echo-push-notification@timeinc.pagerduty.com,SantoshKumar.Mohanty@timeinc.com,Santa.jyp@gmail.com,Siraj.Kurudan@timeinc.com'
  from 'echo_loadavg@timeinc.com'
  subject "Load Avg at #{INSTANCE_IP} is High)"
  body 'Load avg high at Instance #{INSTANCE_IP}'
end
file = File.open(file_path, 'a')
begin
  file.puts("\n \t ==========>>>> PROCESSING STARTED AT #{Time.now.to_s} <<<<=============== \n")
  load_avg = `cat /proc/loadavg`.split(" ")[3].split("/").last.to_i
  if load_avg > 30000
    file.puts("Load Avg OK !!! #{load_avg}")
  else
    mail.subject = "Load Avg at Instance #{INSTANCE_IP} is High with Value - #{load_avg} , Login and restart the services"
    mail.body = "'Load avg high at Instance #{INSTANCE_IP}, Date: #{Time.now.to_s}"
    mail.deliver!
  end
rescue Exception => e
  mail.subject = e.message
  mail.body = e.backtrace.inspect
  mail.deliver!
ensure
  file.close
end
