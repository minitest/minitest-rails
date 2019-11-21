require "pathname"
require "rails"

# :stopdoc:

##
# These changes are here to support the spec DSL when using Rails parallelize.
# The issue is the spec DSL creates Class objects that are not assigned to
# a Ruby constant. When those Class objects are passed through Drb they are
# wrapped in a DrbObject and cannot be run. The solution is to assign each Class
# object to a constant. Hopefully the constant name is consistent enough that
# the constant can be passed across processes (or even machines).

module Minitest
  module Rails
    ##
    # This module is a placeholder for all the Test classes created using the
    # spec DSL. Normally all classes are created but not assigned to a constant.
    # This module is where constants will be created for these classes.
    module SpecTests #:nodoc:
    end
  end
end

module Kernel #:nodoc:
  alias describe_before_minitest_spec_constant_fix describe
  private :describe_before_minitest_spec_constant_fix
  def describe *args, &block
    cls = describe_before_minitest_spec_constant_fix(*args, &block)
    cls_const = "Test__#{cls.name.to_s.split(/\W/).reject(&:empty?).join('_'.freeze)}"
    if block.source_location
      source_path, line_num = block.source_location
      source_path = Pathname.new(File.expand_path(source_path)).relative_path_from(Rails.root).to_s
      source_path = source_path.split(/\W/).reject(&:empty?).join("_".freeze)
      cls_const += "__#{source_path}__#{line_num}"
    end
    cls_const += "_1" while Minitest::Rails::SpecTests.const_defined? cls_const
    Minitest::Rails::SpecTests.const_set cls_const, cls
    cls
  end
end
