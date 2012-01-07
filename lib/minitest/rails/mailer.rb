require "minitest/rails/spec"

module MiniTest
  module Rails
    class Mailer < Spec
    end
  end
end

MiniTest::Spec.register_spec_type MiniTest::Rails::Mailer do |desc|
  desc < ActionMailer::Base
end

