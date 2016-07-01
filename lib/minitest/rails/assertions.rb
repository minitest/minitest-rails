class ActiveSupport::TestCase
  ##
  # Checks the numeric difference between the return value of an expression as a result of what is evaluated.
  #
  #     assert_difference "User.count", +1 do
  #       User.create
  #     end
  #
  # See also Minitest::Rails::Expectations#must_change
  #
  # :method: assert_difference
  # :call-seq: assert_difference(expression, difference = 1, message = nil, &block)

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     assert_no_difference "User.count" do
  #       User.new
  #     end
  #
  # See also Minitest::Rails::Expectations#wont_change
  #
  # :method: assert_no_difference
  # :call-seq: assert_no_difference(expression, message = nil, &block)

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     refute_difference "User.count", do
  #       User.new
  #     end
  #
  # See also Minitest::Rails::Expectations#wont_change
  #
  # :args: expression, message = nil, &block
  alias :refute_difference :assert_no_difference

end

class ActionView::TestCase
  ##
  # Checks the numeric difference between the return value of an expression as a result of what is evaluated.
  #
  #     assert_difference "User.count", +1 do
  #       User.create
  #     end
  #
  # See also Minitest::Rails::Expectations#must_change
  #
  # :method: assert_difference
  # :call-seq: assert_difference(expression, difference = 1, message = nil, &block)

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     assert_no_difference "User.count" do
  #       User.new
  #     end
  #
  # See also Minitest::Rails::Expectations#wont_change
  #
  # :method: assert_no_difference
  # :call-seq: assert_no_difference(expression, message = nil, &block)

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     refute_difference "User.count", do
  #       User.new
  #     end
  #
  # See also Minitest::Rails::Expectations#wont_change
  #
  # :args: expression, message = nil, &block
  alias :refute_difference :assert_no_difference

  # Asserts that the response is one of the following types:
  #
  # * <tt>:success</tt>   - Status code was in the 200-299 range
  # * <tt>:redirect</tt>  - Status code was in the 300-399 range
  # * <tt>:missing</tt>   - Status code was 404
  # * <tt>:error</tt>     - Status code was in the 500-599 range
  #
  # You can also pass an explicit status number like <tt>assert_response(501)</tt>
  # or its symbolic equivalent <tt>assert_response(:not_implemented)</tt>.
  # See Rack::Utils::SYMBOL_TO_STATUS_CODE for a full list.
  #
  #     # assert that the response was a redirection
  #     assert_response :redirect
  #
  #     # assert that the response code was status code 401 (unauthorized)
  #     assert_response 401
  #
  # See also Minitest::Rails::Expectations#must_respond_with
  #
  # :method: assert_response
  # :call-seq: assert_response(type, message = nil)

  ##
  # Assert that the redirection options passed in match those of the redirect called in the latest action.
  # This match can be partial, such that <tt>assert_redirected_to(controller: "weblog")</tt> will also
  # match the redirection of <tt>redirect_to(controller: "weblog", action: "show")</tt> and so on.
  #
  #     # assert that the redirection was to the "index" action on the WeblogController
  #     assert_redirected_to controller: "weblog", action: "index"
  #
  #     # assert that the redirection was to the named route login_url
  #     assert_redirected_to login_url
  #
  #     # assert that the redirection was to the url for @customer
  #     assert_redirected_to @customer
  #
  #     # asserts that the redirection matches the regular expression
  #     assert_redirected_to %r(\Ahttp://example.org)
  #
  # See also Minitest::Rails::Expectations#must_redirect_to
  #
  # :method: assert_redirected_to
  # :call-seq: assert_redirected_to(options = {}, message=nil)

  ##
  # Asserts that the provided options can be used to generate the provided path. This is the inverse of +assert_recognizes+.
  # The +extras+ parameter is used to tell the request the names and values of additional request parameters that would be in
  # a query string. The +message+ parameter allows you to specify a custom error message for assertion failures.
  #
  # The +defaults+ parameter is unused.
  #
  #   # Asserts that the default action is generated for a route with no action
  #   assert_generates "/items", controller: "items", action: "index"
  #
  #   # Tests that the list action is properly routed
  #   assert_generates "/items/list", controller: "items", action: "list"
  #
  #   # Tests the generation of a route with a parameter
  #   assert_generates "/items/list/1", { controller: "items", action: "list", id: "1" }
  #
  #   # Asserts that the generated route gives us our custom route
  #   assert_generates "changesets/12", { controller: 'scm', action: 'show_diff', revision: "12" }
  #
  # See also Minitest::Rails::Expectations#must_route_to
  #
  # :method: assert_generates
  # :call-seq: assert_generates(expected_path, options, defaults={}, extras = {}, message=nil)

  ##
  # Asserts that the routing of the given +path+ was handled correctly and that the parsed options (given in the +expected_options+ hash)
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
  #   # assert that a path of '/items/list/1?view=print' returns the correct options
  #   assert_recognizes({controller: 'items', action: 'list', id: '1', view: 'print'}, 'items/list/1', { view: "print" })
  #
  # The +message+ parameter allows you to pass in an error message that is displayed upon failure.
  #
  #   # Check the default route (i.e., the index action)
  #   assert_recognizes({controller: 'items', action: 'index'}, 'items')
  #
  #   # Test a specific action
  #   assert_recognizes({controller: 'items', action: 'list'}, 'items/list')
  #
  #   # Test an action with a parameter
  #   assert_recognizes({controller: 'items', action: 'destroy', id: '1'}, 'items/destroy/1')
  #
  #   # Test a custom route
  #   assert_recognizes({controller: 'items', action: 'show', id: '1'}, 'view/item1')
  #
  # See also Minitest::Rails::Expectations#must_route_from
  #
  # :method: assert_recognizes
  # :call-seq: assert_recognizes(expected_options, path, extras={}, msg=nil)

  ##
  # Asserts that path and options match both ways; in other words, it verifies that <tt>path</tt> generates
  # <tt>options</tt> and then that <tt>options</tt> generates <tt>path</tt>. This essentially combines +assert_recognizes+
  # and +assert_generates+ into one step.
  #
  # The +extras+ hash allows you to specify options that would normally be provided as a query string to the action. The
  # +message+ parameter allows you to specify a custom error message to display upon failure.
  #
  #  # Assert a basic route: a controller with the default action (index)
  #  assert_routing '/home', controller: 'home', action: 'index'
  #
  #  # Test a route generated with a specific controller, action, and parameter (id)
  #  assert_routing '/entries/show/23', controller: 'entries', action: 'show', id: 23
  #
  #  # Assert a basic route (controller + default action), with an error message if it fails
  #  assert_routing '/store', { controller: 'store', action: 'index' }, {}, {}, 'Route for store index not generated properly'
  #
  #  # Tests a route, providing a defaults hash
  #  assert_routing 'controller/action/9', {id: "9", item: "square"}, {controller: "controller", action: "action"}, {}, {item: "square"}
  #
  #  # Tests a route with a HTTP method
  #  assert_routing({ method: 'put', path: '/product/321' }, { controller: "product", action: "update", id: "321" })
  #
  # See also Minitest::Rails::Expectations#must_route
  #
  # :method: assert_routing
  # :call-seq: assert_routing(path, options, defaults={}, extras={}, message=nil)

  # An assertion that selects elements and makes one or more equality tests.
  #
  # If the first argument is an element, selects all matching elements
  # starting from (and including) that element and all its children in
  # depth-first order.
  #
  # If no element if specified, calling +assert_select+ selects from the
  # response HTML unless +assert_select+ is called from within an +assert_select+ block.
  #
  # When called with a block +assert_select+ passes an array of selected elements
  # to the block. Calling +assert_select+ from the block, with no element specified,
  # runs the assertion on the complete set of elements selected by the enclosing assertion.
  # Alternatively the array may be iterated through so that +assert_select+ can be called
  # separately for each element.
  #
  #
  # ==== Example
  # If the response contains two ordered lists, each with four list elements then:
  #   assert_select "ol" do |elements|
  #     elements.each do |element|
  #       assert_select element, "li", 4
  #     end
  #   end
  #
  # will pass, as will:
  #   assert_select "ol" do
  #     assert_select "li", 8
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
  # If no equality test specified, the assertion is true if at least one
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
  #   assert_select "form"
  #
  #   # Form element includes four input fields
  #   assert_select "form input", 4
  #
  #   # Page title is "Welcome"
  #   assert_select "title", "Welcome"
  #
  #   # Page title is "Welcome" and there is only one title element
  #   assert_select "title", {count: 1, text: "Welcome"},
  #       "Wrong title or more than one title element"
  #
  #   # Page contains no forms
  #   assert_select "form", false, "This page must contain no forms"
  #
  #   # Test the content and style
  #   assert_select "body div.header ul.menu"
  #
  #   # Use substitution values
  #   assert_select "ol>li#?", /item-\d+/
  #
  #   # All input fields in the form have a name
  #   assert_select "form input" do
  #     assert_select "[name=?]", /.+/  # Not empty
  #   end
  #
  # See also Minitest::Rails::Expectations#must_select
  #
  # :method: assert_select
  # :call-seq: assert_select(*args, &block)

  # Extracts the body of an email and runs nested assertions on it.
  #
  # You must enable deliveries for this assertion to work, use:
  #   ActionMailer::Base.perform_deliveries = true
  #
  #  assert_select_email do
  #    assert_select "h1", "Email alert"
  #  end
  #
  #  assert_select_email do
  #    items = assert_select "ol>li"
  #    items.each do
  #       # Work with items here...
  #    end
  #  end
  #
  # See also Minitest::Rails::Expectations#must_select_email
  #
  # :method: assert_select_email
  # :call-seq: assert_select_email(&block)

  # Extracts the content of an element, treats it as encoded HTML and runs
  # nested assertion on it.
  #
  # You typically call this method within another assertion to operate on
  # all currently selected elements. You can also pass an element or array
  # of elements.
  #
  # The content of each element is un-encoded, and wrapped in the root
  # element +encoded+. It then calls the block with all un-encoded elements.
  #
  #   # Selects all bold tags from within the title of an Atom feed's entries (perhaps to nab a section name prefix)
  #   assert_select "feed[xmlns='http://www.w3.org/2005/Atom']" do
  #     # Select each entry item and then the title item
  #     assert_select "entry>title" do
  #       # Run assertions on the encoded title elements
  #       assert_select_encoded do
  #         assert_select "b"
  #       end
  #     end
  #   end
  #
  #
  #   # Selects all paragraph tags from within the description of an RSS feed
  #   assert_select "rss[version=2.0]" do
  #     # Select description element of each feed item.
  #     assert_select "channel>item>description" do
  #       # Run assertions on the encoded elements.
  #       assert_select_encoded do
  #         assert_select "p"
  #       end
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations#must_select_encoded
  #
  # :method: assert_select_encoded
  # :call-seq: assert_select_encoded(element = nil, &block)

  ##
  # Checks that two HTML strings are equivalent. That they contain the same elements and attributes with the associated values.
  #
  #     assert_dom_equal '<a href="http://www.example.com">Apples</a>',
  #                      link_to("Apples", "http://www.example.com")
  #
  # See also Minitest::Rails::Expectations#must_dom_equal
  #
  # :method: assert_dom_equal
  # :call-seq: assert_dom_equal(expected, actual, message = nil)

  ##
  # Checks that two HTML strings are not equivalent. That they do not contain the same elements and attributes with the associated values.
  #
  #     assert_dom_not_equal '<a href="http://www.example.com">Oranges</a>',
  #                          link_to("Apples", "http://www.example.com")
  #
  # See also Minitest::Rails::Expectations#wont_dom_equal
  #
  # :method: assert_dom_not_equal
  # :call-seq: assert_dom_not_equal(expected, actual, message = nil)

  ##
  # Checks that two HTML strings are not equivalent. That they do not contain the same elements and attributes with the associated values.
  #
  #     refute_dom_equal '<a href="http://www.example.com">Oranges</a>',
  #                      link_to("Apples", "http://www.example.com")
  #
  # See also Minitest::Rails::Expectations#wont_dom_equal
  #
  # :method: assert_dom_equal
  # :call-seq: assert_dom_equal(expected, actual, message = nil)
  alias :refute_dom_equal :assert_dom_not_equal
end

class ActionDispatch::IntegrationTest
  ##
  # Checks the numeric difference between the return value of an expression as a result of what is evaluated.
  #
  #     assert_difference "User.count", +1 do
  #       User.create
  #     end
  #
  # See also Minitest::Rails::Expectations#must_change
  #
  # :method: assert_difference
  # :call-seq: assert_difference(expression, difference = 1, message = nil, &block)

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     assert_no_difference "User.count" do
  #       User.new
  #     end
  #
  # See also Minitest::Rails::Expectations#wont_change
  #
  # :method: assert_no_difference
  # :call-seq: assert_no_difference(expression, message = nil, &block)

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     refute_difference "User.count", do
  #       User.new
  #     end
  #
  # See also Minitest::Rails::Expectations#wont_change
  #
  # :args: expression, message = nil, &block
  alias :refute_difference :assert_no_difference

  # Asserts that the response is one of the following types:
  #
  # * <tt>:success</tt>   - Status code was in the 200-299 range
  # * <tt>:redirect</tt>  - Status code was in the 300-399 range
  # * <tt>:missing</tt>   - Status code was 404
  # * <tt>:error</tt>     - Status code was in the 500-599 range
  #
  # You can also pass an explicit status number like <tt>assert_response(501)</tt>
  # or its symbolic equivalent <tt>assert_response(:not_implemented)</tt>.
  # See Rack::Utils::SYMBOL_TO_STATUS_CODE for a full list.
  #
  #     # assert that the response was a redirection
  #     assert_response :redirect
  #
  #     # assert that the response code was status code 401 (unauthorized)
  #     assert_response 401
  #
  # See also Minitest::Rails::Expectations#must_respond_with
  #
  # :method: assert_response
  # :call-seq: assert_response(type, message = nil)

  ##
  # Assert that the redirection options passed in match those of the redirect called in the latest action.
  # This match can be partial, such that <tt>assert_redirected_to(controller: "weblog")</tt> will also
  # match the redirection of <tt>redirect_to(controller: "weblog", action: "show")</tt> and so on.
  #
  #     # assert that the redirection was to the "index" action on the WeblogController
  #     assert_redirected_to controller: "weblog", action: "index"
  #
  #     # assert that the redirection was to the named route login_url
  #     assert_redirected_to login_url
  #
  #     # assert that the redirection was to the url for @customer
  #     assert_redirected_to @customer
  #
  #     # asserts that the redirection matches the regular expression
  #     assert_redirected_to %r(\Ahttp://example.org)
  #
  # See also Minitest::Rails::Expectations#must_redirect_to
  #
  # :method: assert_redirected_to
  # :call-seq: assert_redirected_to(options = {}, message=nil)

  ##
  # Asserts that the provided options can be used to generate the provided path. This is the inverse of +assert_recognizes+.
  # The +extras+ parameter is used to tell the request the names and values of additional request parameters that would be in
  # a query string. The +message+ parameter allows you to specify a custom error message for assertion failures.
  #
  # The +defaults+ parameter is unused.
  #
  #   # Asserts that the default action is generated for a route with no action
  #   assert_generates "/items", controller: "items", action: "index"
  #
  #   # Tests that the list action is properly routed
  #   assert_generates "/items/list", controller: "items", action: "list"
  #
  #   # Tests the generation of a route with a parameter
  #   assert_generates "/items/list/1", { controller: "items", action: "list", id: "1" }
  #
  #   # Asserts that the generated route gives us our custom route
  #   assert_generates "changesets/12", { controller: 'scm', action: 'show_diff', revision: "12" }
  #
  # See also Minitest::Rails::Expectations#must_route_to
  #
  # :method: assert_generates
  # :call-seq: assert_generates(expected_path, options, defaults={}, extras = {}, message=nil)

  ##
  # Asserts that the routing of the given +path+ was handled correctly and that the parsed options (given in the +expected_options+ hash)
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
  #   # assert that a path of '/items/list/1?view=print' returns the correct options
  #   assert_recognizes({controller: 'items', action: 'list', id: '1', view: 'print'}, 'items/list/1', { view: "print" })
  #
  # The +message+ parameter allows you to pass in an error message that is displayed upon failure.
  #
  #   # Check the default route (i.e., the index action)
  #   assert_recognizes({controller: 'items', action: 'index'}, 'items')
  #
  #   # Test a specific action
  #   assert_recognizes({controller: 'items', action: 'list'}, 'items/list')
  #
  #   # Test an action with a parameter
  #   assert_recognizes({controller: 'items', action: 'destroy', id: '1'}, 'items/destroy/1')
  #
  #   # Test a custom route
  #   assert_recognizes({controller: 'items', action: 'show', id: '1'}, 'view/item1')
  #
  # See also Minitest::Rails::Expectations#must_route_from
  #
  # :method: assert_recognizes
  # :call-seq: assert_recognizes(expected_options, path, extras={}, msg=nil)

  ##
  # Asserts that path and options match both ways; in other words, it verifies that <tt>path</tt> generates
  # <tt>options</tt> and then that <tt>options</tt> generates <tt>path</tt>. This essentially combines +assert_recognizes+
  # and +assert_generates+ into one step.
  #
  # The +extras+ hash allows you to specify options that would normally be provided as a query string to the action. The
  # +message+ parameter allows you to specify a custom error message to display upon failure.
  #
  #  # Assert a basic route: a controller with the default action (index)
  #  assert_routing '/home', controller: 'home', action: 'index'
  #
  #  # Test a route generated with a specific controller, action, and parameter (id)
  #  assert_routing '/entries/show/23', controller: 'entries', action: 'show', id: 23
  #
  #  # Assert a basic route (controller + default action), with an error message if it fails
  #  assert_routing '/store', { controller: 'store', action: 'index' }, {}, {}, 'Route for store index not generated properly'
  #
  #  # Tests a route, providing a defaults hash
  #  assert_routing 'controller/action/9', {id: "9", item: "square"}, {controller: "controller", action: "action"}, {}, {item: "square"}
  #
  #  # Tests a route with a HTTP method
  #  assert_routing({ method: 'put', path: '/product/321' }, { controller: "product", action: "update", id: "321" })
  #
  # See also Minitest::Rails::Expectations#must_route
  #
  # :method: assert_routing
  # :call-seq: assert_routing(path, options, defaults={}, extras={}, message=nil)

  # An assertion that selects elements and makes one or more equality tests.
  #
  # If the first argument is an element, selects all matching elements
  # starting from (and including) that element and all its children in
  # depth-first order.
  #
  # If no element if specified, calling +assert_select+ selects from the
  # response HTML unless +assert_select+ is called from within an +assert_select+ block.
  #
  # When called with a block +assert_select+ passes an array of selected elements
  # to the block. Calling +assert_select+ from the block, with no element specified,
  # runs the assertion on the complete set of elements selected by the enclosing assertion.
  # Alternatively the array may be iterated through so that +assert_select+ can be called
  # separately for each element.
  #
  #
  # ==== Example
  # If the response contains two ordered lists, each with four list elements then:
  #   assert_select "ol" do |elements|
  #     elements.each do |element|
  #       assert_select element, "li", 4
  #     end
  #   end
  #
  # will pass, as will:
  #   assert_select "ol" do
  #     assert_select "li", 8
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
  # If no equality test specified, the assertion is true if at least one
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
  #   assert_select "form"
  #
  #   # Form element includes four input fields
  #   assert_select "form input", 4
  #
  #   # Page title is "Welcome"
  #   assert_select "title", "Welcome"
  #
  #   # Page title is "Welcome" and there is only one title element
  #   assert_select "title", {count: 1, text: "Welcome"},
  #       "Wrong title or more than one title element"
  #
  #   # Page contains no forms
  #   assert_select "form", false, "This page must contain no forms"
  #
  #   # Test the content and style
  #   assert_select "body div.header ul.menu"
  #
  #   # Use substitution values
  #   assert_select "ol>li#?", /item-\d+/
  #
  #   # All input fields in the form have a name
  #   assert_select "form input" do
  #     assert_select "[name=?]", /.+/  # Not empty
  #   end
  #
  # See also Minitest::Rails::Expectations#must_select
  #
  # :method: assert_select
  # :call-seq: assert_select(*args, &block)

  # Extracts the body of an email and runs nested assertions on it.
  #
  # You must enable deliveries for this assertion to work, use:
  #   ActionMailer::Base.perform_deliveries = true
  #
  #  assert_select_email do
  #    assert_select "h1", "Email alert"
  #  end
  #
  #  assert_select_email do
  #    items = assert_select "ol>li"
  #    items.each do
  #       # Work with items here...
  #    end
  #  end
  #
  # See also Minitest::Rails::Expectations#must_select_email
  #
  # :method: assert_select_email
  # :call-seq: assert_select_email(&block)

  # Extracts the content of an element, treats it as encoded HTML and runs
  # nested assertion on it.
  #
  # You typically call this method within another assertion to operate on
  # all currently selected elements. You can also pass an element or array
  # of elements.
  #
  # The content of each element is un-encoded, and wrapped in the root
  # element +encoded+. It then calls the block with all un-encoded elements.
  #
  #   # Selects all bold tags from within the title of an Atom feed's entries (perhaps to nab a section name prefix)
  #   assert_select "feed[xmlns='http://www.w3.org/2005/Atom']" do
  #     # Select each entry item and then the title item
  #     assert_select "entry>title" do
  #       # Run assertions on the encoded title elements
  #       assert_select_encoded do
  #         assert_select "b"
  #       end
  #     end
  #   end
  #
  #
  #   # Selects all paragraph tags from within the description of an RSS feed
  #   assert_select "rss[version=2.0]" do
  #     # Select description element of each feed item.
  #     assert_select "channel>item>description" do
  #       # Run assertions on the encoded elements.
  #       assert_select_encoded do
  #         assert_select "p"
  #       end
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations#must_select_encoded
  #
  # :method: assert_select_encoded
  # :call-seq: assert_select_encoded(element = nil, &block)

  ##
  # Checks that two HTML strings are equivalent. That they contain the same elements and attributes with the associated values.
  #
  #     assert_dom_equal '<a href="http://www.example.com">Apples</a>',
  #                      link_to("Apples", "http://www.example.com")
  #
  # See also Minitest::Rails::Expectations#must_dom_equal
  #
  # :method: assert_dom_equal
  # :call-seq: assert_dom_equal(expected, actual, message = nil)

  ##
  # Checks that two HTML strings are not equivalent. That they do not contain the same elements and attributes with the associated values.
  #
  #     assert_dom_not_equal '<a href="http://www.example.com">Oranges</a>',
  #                          link_to("Apples", "http://www.example.com")
  #
  # See also Minitest::Rails::Expectations#wont_dom_equal
  #
  # :method: assert_dom_not_equal
  # :call-seq: assert_dom_not_equal(expected, actual, message = nil)

  ##
  # Checks that two HTML strings are not equivalent. That they do not contain the same elements and attributes with the associated values.
  #
  #     refute_dom_equal '<a href="http://www.example.com">Oranges</a>',
  #                      link_to("Apples", "http://www.example.com")
  #
  # See also Minitest::Rails::Expectations#wont_dom_equal
  #
  # :method: assert_dom_equal
  # :call-seq: assert_dom_equal(expected, actual, message = nil)
  alias :refute_dom_equal :assert_dom_not_equal
end

if defined? ActiveJob
  class ActiveJob::TestCase
    # Asserts that the number of enqueued jobs matches the given number.
    #
    #   def test_jobs
    #     assert_enqueued_jobs 0
    #     HelloJob.perform_later('david')
    #     assert_enqueued_jobs 1
    #     HelloJob.perform_later('abdelkader')
    #     assert_enqueued_jobs 2
    #   end
    #
    # If a block is passed, that block should cause the specified number of
    # jobs to be enqueued.
    #
    #   def test_jobs_again
    #     assert_enqueued_jobs 1 do
    #       HelloJob.perform_later('cristian')
    #     end
    #
    #     assert_enqueued_jobs 2 do
    #       HelloJob.perform_later('aaron')
    #       HelloJob.perform_later('rafael')
    #     end
    #   end
    #
    # See also Minitest::Rails::Expectations#must_enqueue_jobs
    #
    # :method: assert_enqueued_jobs
    # :call-seq: assert_enqueued_jobs(number)

    ##
    # Asserts that no jobs have been enqueued.
    #
    #   def test_jobs
    #     assert_no_enqueued_jobs
    #     HelloJob.perform_later('jeremy')
    #     assert_enqueued_jobs 1
    #   end
    #
    # If a block is passed, that block should not cause any job to be enqueued.
    #
    #   def test_jobs_again
    #     assert_no_enqueued_jobs do
    #       # No job should be enqueued from this block
    #     end
    #   end
    #
    # Note: This assertion is simply a shortcut for:
    #
    #   assert_enqueued_jobs 0, &block
    #
    # See also Minitest::Rails::Expectations#wont_enqueue_jobs
    #
    # :method: assert_no_enqueued_jobs
    # :call-seq: assert_no_enqueued_jobs(number)

    ##
    # Asserts that the number of performed jobs matches the given number.
    # If no block is passed, <tt>perform_enqueued_jobs</tt>d
    # must be called around the job call.
    #
    #   def test_jobs
    #     assert_performed_jobs 0
    #
    #     perform_enqueued_jobs do
    #       HelloJob.perform_later('xavier')
    #     end
    #     assert_performed_jobs 1
    #
    #     perform_enqueued_jobs do
    #       HelloJob.perform_later('yves')
    #       assert_performed_jobs 2
    #     end
    #   end
    #
    # If a block is passed, that block should cause the specified number of
    # jobs to be performed.
    #
    #   def test_jobs_again
    #     assert_performed_jobs 1 do
    #       HelloJob.perform_later('robin')
    #     end
    #
    #     assert_performed_jobs 2 do
    #       HelloJob.perform_later('carlos')
    #       HelloJob.perform_later('sean')
    #     end
    #   end
    #
    # See also Minitest::Rails::Expectations#must_perform_jobs
    #
    # :method: assert_performed_jobs
    # :call-seq: assert_performed_jobs(number)

    ##
    # Asserts that no jobs have been performed.
    #
    #   def test_jobs
    #     assert_no_performed_jobs
    #
    #     perform_enqueued_jobs do
    #       HelloJob.perform_later('matthew')
    #       assert_performed_jobs 1
    #     end
    #   end
    #
    # If a block is passed, that block should not cause any job to be performed.
    #
    #   def test_jobs_again
    #     assert_no_performed_jobs do
    #       # No job should be performed from this block
    #     end
    #   end
    #
    # Note: This assertion is simply a shortcut for:
    #
    #   assert_performed_jobs 0, &block
    #
    # See also Minitest::Rails::Expectations#wont_perform_jobs
    #
    # :method: assert_no_performed_jobs
    # :call-seq: assert_no_performed_jobs(number)

    ##
    # Asserts that the job passed in the block has been enqueued with the given arguments.
    #
    #   def test_assert_enqueued_with
    #     assert_enqueued_with(job: MyJob, args: [1,2,3], queue: 'low') do
    #       MyJob.perform_later(1,2,3)
    #     end
    #   end
    #
    # See also Minitest::Rails::Expectations#must_enqueue_with
    #
    # :method: assert_enqueued_with
    # :call-seq: assert_enqueued_with(args)

    ##
    # Asserts that the job passed in the block has been performed with the given arguments.
    #
    #   def test_assert_performed_with
    #     assert_performed_with(job: MyJob, args: [1,2,3], queue: 'high') do
    #       MyJob.perform_later(1,2,3)
    #     end
    #   end
    #
    # See also Minitest::Rails::Expectations#must_perform_with
    #
    # :method: assert_performed_with
    # :call-seq: assert_performed_with(args)
  end
end
