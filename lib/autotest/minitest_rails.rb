require 'autotest'
require "minitest/rails/version"

class Autotest::MinitestRails < Autotest
  VERSION = MiniTest::Rails::VERSION

  def initialize # :nodoc:
    super

    add_exception %r%^\./(?:db|doc|log|public|script|tmp|vendor)%

    clear_mappings

    add_mapping %r%^app/models/(.*)\.rb$% do |_, m|
      files_matching %r%^test/models/#{m[1]}.*_test.rb$%
    end

    add_mapping %r%^app/controllers/(.*)_controller\.rb$% do |_, m|
      if m[1] == "application" then
        files_matching %r%^test/(controllers|views)/.*_test\.rb$%
      else
        files_matching %r%^test/(controllers|views)/#{m[1]}.*_test.rb$%
      end
    end

    add_mapping %r%^app/helpers/(.*)_helper.rb% do |_, m|
      if m[1] == "application" then
        files_matching %r%^test/(helpers|views|controllers)/.*_test\.rb$%
      else
        files_matching %r%^test/(helpers|views|controllers)/#{m[1]}.*_test.rb$%
      end
    end

    add_mapping %r%^app/views/(.*)/% do |_, m|
      files_matching %r%^test/(controllers|views)/#{m[1]}.*_test.rb$%
    end

    add_mapping %r%^app/mailers/(.*)\.rb$% do |_, m|
      files_matching %r%^test/mailers/#{m[1]}.*_test.rb$%
    end


    add_mapping %r%^app/lib/(.*)\.rb$% do |_, m|
      files_matching %r%^test/lib/#{m[1]}.*_test.rb$%
    end

    add_mapping %r%^test/.*_test\.rb$% do |filename, _|
      filename
    end

    add_mapping %r%^test/fixtures/(.*)s.yml% do |_, m|
      files_matching %r%^test/(models|controllers|views)/#{m[1]}.*_test.rb$%
    end

    add_mapping %r%^config/routes.rb$% do # FIX:
      files_matching %r%^test/(controllers|views|acceptance)/.*_test\.rb$%
    end

    add_mapping %r%^test/*_helper.rb|config/((boot|environment(s/test)?).rb|database.yml)% do
      files_matching %r%^test/(models|controllers|views|lib|acceptance)/.*_test\.rb$%
    end
  end
end
