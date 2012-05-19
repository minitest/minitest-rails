require "minitest/rails/spec"

module Minitest
  module Rails
    class Helper < Spec
      include ActiveSupport::Testing::SetupAndTeardown
      include ActionView::TestCase::Behavior

        def self.helper_class
          # As of Rails 3.2.3, the original implementation breaks
          # for nested contexts as it appends context names.
          # We need to determine the name of the top-level context.

          context_class = self
          context_super = context_class.superclass

          while context_super && context_super != Minitest::Rails::Helper
            context_class = context_super
            context_super = context_super.superclass
          end

          if context_class
            @helper_class ||= determine_default_helper_class(context_class.name)
          else
            super
          end
        end
    end
  end
end
