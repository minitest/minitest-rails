#TODO: add some more rails specific assertions and infect them;)

require "active_support/testing/assertions"
require "action_dispatch/testing/assertions"
require "action_controller/test_case"

module MiniTest
  module Rails
    module Assertions
      def self.included(klass)
        klass.class_eval do
          include ActiveSupport::Testing::SetupAndTeardown
          include ActiveSupport::Testing::Assertions
          include ActionDispatch::Assertions
          include ActionController::TemplateAssertions
        end
      end
    end
  end
end

module MiniTest::Expectations
  ##
  # See ActiveSupport::Testing::Assertions#assert_difference
  #
  #    proc { ... }.must_change(expression, difference = 1, message = nil)
  #
  # :method: must_change
  infect_an_assertion :assert_difference, :must_change

  ##
  # See ActiveSupport::Testing::Assertions#assert_no_difference
  #
  #    proc { ... }.wont_change(expression, message = nil)
  #
  # :method: wont_change
  infect_an_assertion :assert_no_difference, :wont_change

  ##
  # See ActiveSupport::Testing::Assertions#assert_blank
  #
  #    proc { ... }.must_be_blank(object, message = nil)
  #
  # :method: must_be_blank
  infect_an_assertion :assert_blank, :must_be_blank

  ##
  # See ActiveSupport::Testing::Assertions#assert_present
  #
  #    proc { ... }.must_be_present(object, message = nil)
  #
  # :method: must_be_present
  infect_an_assertion :assert_present, :must_be_present

  ##
  # See ActionDispatch::Assertions::ResponseAssertions#assert_redirected_to
  #
  #    must_redirect_to(options={}, message = nil)
  #
  # :method: must_redirect_to
  infect_an_assertion :assert_redirected_to, :must_redirect_to

  ##
  # See ActionDispatch::Assertions::ResponseAssertions#assert_response
  #
  #    must_respond_with(type, message = nil)
  #
  # :method: must_respond_with
  infect_an_assertion :assert_response, :must_respond_with

  ##
  # See ActionController::TemplateAssertions#assert_template
  #
  #    must_render_template(options={}, message = nil)
  #
  # :method: must_render_template
  infect_an_assertion :assert_template, :must_render_template
end

