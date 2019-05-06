require "minitest/rails/expectations/active_support"
require "minitest/rails/expectations/action_dispatch"
require "minitest/rails/expectations/active_job" if defined? ActiveJob
require "minitest/rails/expectations/action_cable" if defined? ActionCable
require "minitest/rails/expectations/action_mailer" if defined? ActionMailer
