require "minitest/rails/spec"

module MiniTest
  module Rails
    class Model < Spec
      subject do
        self.class.name.split("::").first.constantize.new
      end
    end
  end
end

MiniTest::Spec.register_spec_type MiniTest::Rails::Model do |desc|
  begin
    desc < ActiveRecord::Base
  rescue ArgumentError
  end
end

