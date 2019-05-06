require "active_support/concern"
require "minitest/rails/expectations/active_support"

module Minitest
  module Rails
    module Expectations
      # This exists as a module to allow easy mixing into classes other than
      # ActionDispatch::IntegrationTest where you might want to do job testing.
      module ActionDispatch
        ##
        # Expects that the provided options can be used to generate the provided path. This is the inverse of +assert_recognizes+.
        # The +extras+ parameter is used to tell the request the names and values of additional request parameters that would be in
        # a query string. The +message+ parameter allows you to specify a custom error message for assertion failures.
        #
        # The +defaults+ parameter is unused.
        #
        #   # Expects that the default action is generated for a route with no action
        #   value({controller: "items", action: "index"}).must_route_from "/items"
        #
        #   # Tests that the list action is properly routed
        #   value({controller: "items", action: "list"}).must_route_to "/items/list"
        #
        #   # Tests the generation of a route with a parameter
        #   value({ controller: "items", action: "list", id: "1" }).must_route_from "/items/list/1"
        #
        #   # Expects that the generated route gives us our custom route
        #   value({ controller: 'scm', action: 'show_diff', revision: "12" }).must_route_from "changesets/12"
        #
        # See also ActionView::TestCase#assert_generates
        # See also ActionDispatch::IntegrationTest#assert_generates
        #
        # :method: must_route_from
        # :call-seq: options.must_route_from(expected_path, defaults={}, extras = {}, message=nil)
        infect_an_assertion :assert_generates, :must_route_to

        ##
        # Expects that the routing of the given +path+ was handled correctly and that the parsed options (given in the +expected_options+ hash)
        # match +path+. Basically, it asserts that \Rails recognizes the route given by +expected_options+.
        #
        # Pass a hash in the second argument (+path+) to specify the request method. This is useful for routes
        # requiring a specific HTTP method. The hash should contain a :path with the incoming request path
        # and a :method containing the required HTTP verb.
        #
        #   # assert that POSTing to /items will call the create action on ItemsController
        #   assert_recognizes({controller: 'items', action: 'create'}, {path: 'items', method: :post})
        #
        # You can also pass in +extras+ with a hash containing URL parameters that would normally be in the query string. This can be used
        # to assert that values in the query string string will end up in the params hash correctly. To test query strings you must use the
        # extras argument, appending the query string on the path directly will not work. For example:
        #
        #   # Expect that a path of '/items/list/1?view=print' returns the correct options
        #   value('items/list/1').must_route_from({controller: 'items', action: 'list', id: '1', view: 'print'}, { view: "print" })
        #
        # The +message+ parameter allows you to pass in an error message that is displayed upon failure.
        #
        #   # Check the default route (i.e., the index action)
        #   value('items').must_route_from({controller: 'items', action: 'index'})
        #
        #   # Test a specific action
        #   value('items/list').must_route_from({controller: 'items', action: 'list'})
        #
        #   # Test an action with a parameter
        #   value('items/destroy/1').must_route_from({controller: 'items', action: 'destroy', id: '1'})
        #
        #   # Test a custom route
        #   value('view/item1').must_route_from({controller: 'items', action: 'show', id: '1'})
        #
        # See also ActionView::TestCase#assert_recognizes
        # See also ActionDispatch::IntegrationTest#assert_recognizes
        #
        # :method: must_route_from
        # :call-seq: path.must_route_from(expected_options, extras={}, msg=nil)
        infect_an_assertion :assert_recognizes, :must_route_from

        ##
        # Expects that path and options match both ways; in other words, it verifies that <tt>path</tt> generates
        # <tt>options</tt> and then that <tt>options</tt> generates <tt>path</tt>. This essentially combines +assert_recognizes+
        # and +assert_generates+ into one step.
        #
        # The +extras+ hash allows you to specify options that would normally be provided as a query string to the action. The
        # +message+ parameter allows you to specify a custom error message to display upon failure.
        #
        #  # Expect a basic route: a controller with the default action (index)
        #  value({ controller: 'home', action: 'index' }).must_route_for '/home'
        #
        #  # Test a route generated with a specific controller, action, and parameter (id)
        #  value({ controller: 'entries', action: 'show', id: 23 }).must_route_for '/entries/show/23'
        #
        #  # Expect a basic route (controller + default action), with an error message if it fails
        #  value({ controller: 'store', action: 'index' }).must_route_for '/store'
        #
        #  # Tests a route, providing a defaults hash
        #  value({id: "9", item: "square"}).must_route_for 'controller/action/9', {controller: "controller", action: "action"}, {}, {item: "square"}
        #
        #  # Tests a route with a HTTP method
        #  value({ controller: "product", action: "update", id: "321" }).must_route_for({ method: 'put', path: '/product/321' })
        #
        # See also ActionView::TestCase#assert_routing
        # See also ActionDispatch::IntegrationTest#assert_routing
        #
        # :method: must_route_for
        # :call-seq: options.must_route_for(path, defaults={}, extras={}, message=nil)
        infect_an_assertion :assert_routing, :must_route_for

        # An expectation that selects elements and makes one or more equality tests.
        #
        # If the first argument is an element, selects all matching elements
        # starting from (and including) that element and all its children in
        # depth-first order.
        #
        # If no element if specified, calling +must_select+ selects from the
        # response HTML unless +must_select+ is called from within an +must_select+ block.
        #
        # When called with a block +must_select+ passes an array of selected elements
        # to the block. Calling +must_select+ from the block, with no element specified,
        # runs the expectation on the complete set of elements selected by the enclosing expectation.
        # Alternatively the array may be iterated through so that +must_select+ can be called
        # separately for each element.
        #
        #
        # ==== Example
        # If the response contains two ordered lists, each with four list elements then:
        #   must_select "ol" do |elements|
        #     elements.each do |element|
        #       must_select element, "li", 4
        #     end
        #   end
        #
        # will pass, as will:
        #   must_select "ol" do
        #     must_select "li", 8
        #   end
        #
        # The selector may be a CSS selector expression (String), an expression
        # with substitution values, or an HTML::Selector object.
        #
        # === Equality Tests
        #
        # The equality test may be one of the following:
        # * <tt>true</tt> - Assertion is true if at least one element selected.
        # * <tt>false</tt> - Assertion is true if no element selected.
        # * <tt>String/Regexp</tt> - Assertion is true if the text value of at least
        #   one element matches the string or regular expression.
        # * <tt>Integer</tt> - Assertion is true if exactly that number of
        #   elements are selected.
        # * <tt>Range</tt> - Assertion is true if the number of selected
        #   elements fit the range.
        # If no equality test specified, the expectation is true if at least one
        # element selected.
        #
        # To perform more than one equality tests, use a hash with the following keys:
        # * <tt>:text</tt> - Narrow the selection to elements that have this text
        #   value (string or regexp).
        # * <tt>:html</tt> - Narrow the selection to elements that have this HTML
        #   content (string or regexp).
        # * <tt>:count</tt> - Assertion is true if the number of selected elements
        #   is equal to this value.
        # * <tt>:minimum</tt> - Assertion is true if the number of selected
        #   elements is at least this value.
        # * <tt>:maximum</tt> - Assertion is true if the number of selected
        #   elements is at most this value.
        #
        # If the method is called with a block, once all equality tests are
        # evaluated the block is called with an array of all matched elements.
        #
        #   # At least one form element
        #   must_select "form"
        #
        #   # Form element includes four input fields
        #   must_select "form input", 4
        #
        #   # Page title is "Welcome"
        #   must_select "title", "Welcome"
        #
        #   # Page title is "Welcome" and there is only one title element
        #   must_select "title", {count: 1, text: "Welcome"},
        #       "Wrong title or more than one title element"
        #
        #   # Page contains no forms
        #   must_select "form", false, "This page must contain no forms"
        #
        #   # Test the content and style
        #   must_select "body div.header ul.menu"
        #
        #   # Use substitution values
        #   must_select "ol>li#?", /item-\d+/
        #
        #   # All input fields in the form have a name
        #   must_select "form input" do
        #     must_select "[name=?]", /.+/  # Not empty
        #   end
        #
        # See also ActionView::TestCase#assert_select
        # See also ActionDispatch::IntegrationTest#assert_select
        #
        # :method: must_select
        # :call-seq: must_select(*args, &block)

        # Extracts the body of an email and runs nested expectations on it.
        #
        # You must enable deliveries for this expectation to work, use:
        #   ActionMailer::Base.perform_deliveries = true
        #
        #  must_select_email do
        #    must_select "h1", "Email alert"
        #  end
        #
        #  must_select_email do
        #    items = must_select "ol>li"
        #    items.each do
        #       # Work with items here...
        #    end
        #  end
        #
        # See also ActionView::TestCase#assert_select_email
        # See also ActionDispatch::IntegrationTest#assert_select_email
        #
        # :method: must_select_email
        # :call-seq: must_select_email(&block)

        # Extracts the content of an element, treats it as encoded HTML and runs
        # nested expectation on it.
        #
        # You typically call this method within another expectation to operate on
        # all currently selected elements. You can also pass an element or array
        # of elements.
        #
        # The content of each element is un-encoded, and wrapped in the root
        # element +encoded+. It then calls the block with all un-encoded elements.
        #
        #   # Selects all bold tags from within the title of an Atom feed's entries (perhaps to nab a section name prefix)
        #   must_select "feed[xmlns='http://www.w3.org/2005/Atom']" do
        #     # Select each entry item and then the title item
        #     must_select "entry>title" do
        #       # Run expectations on the encoded title elements
        #       must_select_encoded do
        #         must_select "b"
        #       end
        #     end
        #   end
        #
        #
        #   # Selects all paragraph tags from within the description of an RSS feed
        #   must_select "rss[version=2.0]" do
        #     # Select description element of each feed item.
        #     must_select "channel>item>description" do
        #       # Run expectations on the encoded elements.
        #       must_select_encoded do
        #         must_select "p"
        #       end
        #     end
        #   end
        #
        # See also ActionView::TestCase#assert_select_encoded
        # See also ActionDispatch::IntegrationTest#assert_select_encoded
        #
        # :method: must_select_encoded
        # :call-seq: must_select_encoded(element = nil, &block)

        ##
        # Checks that two HTML strings are equivalent. That they contain the same elements and attributes with the associated values.
        # Checks the numeric difference between the return value of an expression as a result of what is evaluated.
        #
        #     apple_link = '<a href="http://www.example.com">Apples</a>'
        #     value(link_to("Apples", "http://www.example.com")).must_dom_equal apple_link
        #
        # See also ActionView::TestCase#assert_dom_equal
        # See also ActionDispatch::IntegrationTest#assert_dom_equal
        #
        # :method: must_dom_equal
        # :args: expected, message = nil
        infect_an_assertion :assert_dom_equal, :must_dom_equal

        ##
        # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
        #
        #     orange_link = '<a href="http://www.example.com">Oranges</a>'
        #     link_to("Apples", "http://www.example.com").wont_dom_equal orange_link
        #
        # See also ActionView::TestCase#refute_dom_equal
        # See also ActionDispatch::IntegrationTest#refute_dom_equal
        # See also ActionView::TestCase#assert_dom_not_equal
        # See also ActionDispatch::IntegrationTest#assert_dom_not_equal
        #
        # :method: wont_dom_equal
        # :args: expected, message = nil
        infect_an_assertion :refute_dom_equal, :wont_dom_equal

        extend ::ActiveSupport::Concern

        included do
          alias_method :must_respond_with, :assert_response
          alias_method :must_redirect_to, :assert_redirected_to
          alias_method :must_select, :assert_select
          alias_method :must_select_email, :assert_select_email
          alias_method :must_select_encoded, :assert_select_encoded
        end
      end
    end
  end
end

unless ENV["MT_NO_EXPECTATIONS"]
  class ActionDispatch::IntegrationTest # :nodoc:
    include Minitest::Rails::Expectations::ActionDispatch
  end
end
