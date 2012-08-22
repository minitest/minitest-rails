require 'rails/generators'

module MiniTest
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      class_option :spec, :type => :boolean, :default => false

      desc "Copy minitest files to your application."
      def install
        if options.spec?
          template "test/minitest_helper.rb", "spec/spec_helper.rb"
        else
          directory "test"
        end
      end
    end
  end
end
