require 'rake/testtask'

module MiniTest
  module Rails
    module Tasks # :nodoc:
      # Silence the default description to cut down on `rake -T` noise.
      class SubTestTask < Rake::TestTask # :nodoc:
        def desc(string)
          # Ignore the description.
        end
      end
    end
  end
end
