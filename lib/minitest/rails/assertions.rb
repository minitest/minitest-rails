require "minitest/rails/assertions/active_support"
require "minitest/rails/assertions/action_view"
require "minitest/rails/assertions/action_dispatch"
require "minitest/rails/assertions/active_job" if defined? ActiveJob
require "minitest/rails/assertions/action_cable" if defined? ActionCable
require "minitest/rails/assertions/action_mailer" if defined? ActionMailer
