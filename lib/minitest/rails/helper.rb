require "minitest/rails/spec"

module MiniTest
  module Rails
    class Helper < Spec
    end
  end
end

MiniTest::Spec.register_spec_type /Helper$/, MiniTest::Rails::Helper

