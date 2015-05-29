require "active_support/concern"

module Minitest::Rails::Expectations

  ##############################################################################
  # ActiveSupport Expectations
  ##############################################################################

  ##
  # Checks the numeric difference between the return value of an expression as a result of what is evaluated.
  #
  #     value { User.create password: "valid" }.must_change "User.count"
  #     value { 3.times do
  #               User.create password: "valid"
  #             end }.must_change "User.count", 3
  #
  # See also ActiveSupport::TestCase#assert_difference
  #
  # :method: must_change
  # :args: expression, difference = 1, message = nil
  infect_an_assertion :assert_difference, :must_change, :block

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     value { User.new }.wont_change "User.count"
  #
  # See also ActiveSupport::TestCase#refute_difference
  #
  # :method: wont_change
  # :args: expression, message = nil
  infect_an_assertion :refute_difference, :wont_change, :block

  ##############################################################################
  # ActionController/ActionView/ActionDispatch Expectations
  ##############################################################################

  # Expects that the response is one of the following types:
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
  #     # expect that the response was a redirection
  #     must_respond_with :redirect
  #     value(response).must_respond_with :redirect
  #
  #     # expect that the response code was status code 401 (unauthorized)
  #     must_respond_with 401
  #     value(response).must_respond_with 401
  #
  # See also ActionController::TestCase#assert_response
  # See also ActionView::TestCase#assert_response
  # See also ActionDispatch::IntegrationTest#assert_response
  #
  # :method: must_respond_with
  # :call-seq: must_respond_with(type, message = nil)

  ##
  # Expects that the redirection options passed in match those of the redirect called in the latest action.
  # This match can be partial, such that <tt>assert_redirected_to(controller: "weblog")</tt> will also
  # match the redirection of <tt>redirect_to(controller: "weblog", action: "show")</tt> and so on.
  #
  #     # expect that the redirection was to the "index" action on the WeblogController
  #     must_redirect_to controller: "weblog", action: "index"
  #
  #     # expect that the redirection was to the named route login_url
  #     must_redirect_to login_url
  #
  #     # expect that the redirection was to the url for @customer
  #     must_redirect_to @customer
  #
  #     # expect that the redirection matches the regular expression
  #     must_redirect_to %r(\Ahttp://example.org)
  #
  # See also ActionController::TestCase#assert_redirected_to
  # See also ActionView::TestCase#assert_redirected_to
  # See also ActionDispatch::IntegrationTest#assert_redirected_to
  #
  # :method: must_redirect_to
  # :call-seq: must_redirect_to(options = {}, message=nil)

  ##
  # Expects that the request was rendered with the appropriate template file or partials.
  #
  #     # expect that the "new" view template was rendered
  #     must_render_template "new"
  #
  #     # expect that the exact template "admin/posts/new" was rendered
  #     must_render_template %r{\Aadmin/posts/new\Z}
  #
  #     # expect that the layout 'admin' was rendered
  #     must_render_template layout: 'admin'
  #     must_render_template layout: 'layouts/admin'
  #     must_render_template layout: :admin
  #
  #     # expect that no layout was rendered
  #     must_render_template layout: nil
  #     must_render_template layout: false
  #
  #     # expect that the "_customer" partial was rendered twice
  #     must_render_template partial: '_customer', count: 2
  #
  #     # expect that no partials were rendered
  #     must_render_template partial: false
  #
  # In a view test case, you can also expect that specific locals are passed
  # to partials:
  #
  #     # expect that the "_customer" partial was rendered with a specific object
  #     must_render_template partial: '_customer', locals: { customer: @customer }
  #
  # See also ActionController::TestCase#assert_template
  # See also ActionView::TestCase#assert_template
  # See also ActionDispatch::IntegrationTest#assert_template
  #
  # :method: must_render_template
  # :call-seq: must_render_template(options = {}, message = nil)

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
  # See also ActionController::TestCase#assert_generates
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
  # See also ActionController::TestCase#assert_recognizes
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
  # See also ActionController::TestCase#assert_routing
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
  # See also ActionController::TestCase#assert_select
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
  # See also ActionController::TestCase#assert_select_email
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
  # See also ActionController::TestCase#assert_select_encoded
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
  # See also ActionController::TestCase#assert_dom_equal
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
  # See also ActionController::TestCase#refute_dom_equal
  # See also ActionView::TestCase#refute_dom_equal
  # See also ActionDispatch::IntegrationTest#refute_dom_equal
  # See also ActionController::TestCase#assert_dom_not_equal
  # See also ActionView::TestCase#assert_dom_not_equal
  # See also ActionDispatch::IntegrationTest#assert_dom_not_equal
  #
  # :method: wont_dom_equal
  # :args: expected, message = nil
  infect_an_assertion :refute_dom_equal, :wont_dom_equal

  ##
  # Expects that there is a tag/node/element in the body of the response
  # that meets all of the given conditions. The +conditions+ parameter must
  # be a hash of any of the following keys (all are optional):
  #
  # * <tt>:tag</tt>: the node type must match the corresponding value
  # * <tt>:attributes</tt>: a hash. The node's attributes must match the
  #   corresponding values in the hash.
  # * <tt>:parent</tt>: a hash. The node's parent must match the
  #   corresponding hash.
  # * <tt>:child</tt>: a hash. At least one of the node's immediate children
  #   must meet the criteria described by the hash.
  # * <tt>:ancestor</tt>: a hash. At least one of the node's ancestors must
  #   meet the criteria described by the hash.
  # * <tt>:descendant</tt>: a hash. At least one of the node's descendants
  #   must meet the criteria described by the hash.
  # * <tt>:sibling</tt>: a hash. At least one of the node's siblings must
  #   meet the criteria described by the hash.
  # * <tt>:after</tt>: a hash. The node must be after any sibling meeting
  #   the criteria described by the hash, and at least one sibling must match.
  # * <tt>:before</tt>: a hash. The node must be before any sibling meeting
  #   the criteria described by the hash, and at least one sibling must match.
  # * <tt>:children</tt>: a hash, for counting children of a node. Accepts
  #   the keys:
  #   * <tt>:count</tt>: either a number or a range which must equal (or
  #     include) the number of children that match.
  #   * <tt>:less_than</tt>: the number of matching children must be less
  #     than this number.
  #   * <tt>:greater_than</tt>: the number of matching children must be
  #     greater than this number.
  #   * <tt>:only</tt>: another hash consisting of the keys to use
  #     to match on the children, and only matching children will be
  #     counted.
  # * <tt>:content</tt>: the textual content of the node must match the
  #   given value. This will not match HTML tags in the body of a
  #   tag--only text.
  #
  # Conditions are matched using the following algorithm:
  #
  # * if the condition is a string, it must be a substring of the value.
  # * if the condition is a regexp, it must match the value.
  # * if the condition is a number, the value must match number.to_s.
  # * if the condition is +true+, the value must not be +nil+.
  # * if the condition is +false+ or +nil+, the value must be +nil+.
  #
  #   # Expect that there is a "span" tag
  #   must_have_tag tag: "span"
  #
  #   # Expect that there is a "span" tag with id="x"
  #   must_have_tag tag: "span", attributes: { id: "x" }
  #
  #   # Expect that there is a "span" tag using the short-hand
  #   must_have_tag :span
  #
  #   # Expect that there is a "span" tag with id="x" using the short-hand
  #   must_have_tag :span, attributes: { id: "x" }
  #
  #   # Expect that there is a "span" inside of a "div"
  #   must_have_tag tag: "span", parent: { tag: "div" }
  #
  #   # Expect that there is a "span" somewhere inside a table
  #   must_have_tag tag: "span", ancestor: { tag: "table" }
  #
  #   # Expect that there is a "span" with at least one "em" child
  #   must_have_tag tag: "span", child: { tag: "em" }
  #
  #   # Expect that there is a "span" containing a (possibly nested)
  #   # "strong" tag.
  #   must_have_tag tag: "span", descendant: { tag: "strong" }
  #
  #   # Expect that there is a "span" containing between 2 and 4 "em" tags
  #   # as immediate children
  #   must_have_tag tag: "span",
  #              children: { count: 2..4, only: { tag: "em" } }
  #
  #   # Get funky: assert that there is a "div", with an "ul" ancestor
  #   # and an "li" parent (with "class" = "enum"), and containing a
  #   # "span" descendant that contains text matching /hello world/
  #   must_have_tag tag: "div",
  #              ancestor: { tag: "ul" },
  #              parent: { tag: "li",
  #                           attributes: { class: "enum" } },
  #              descendant: { tag: "span",
  #                               child: /hello world/ }
  #
  # <b>Please note</b>: +must_have_tag+ and +wont_have_tag+ only work
  # with well-formed XHTML. They recognize a few tags as implicitly self-closing
  # (like br and hr and such) but will not work correctly with tags
  # that allow optional closing tags (p, li, td). <em>You must explicitly
  # close all of your tags to use these assertions.</em>
  #
  # See also ActionController::TestCase#assert_tag
  # See also ActionView::TestCase#assert_tag
  # See also ActionDispatch::IntegrationTest#assert_tag
  #
  # :method: must_have_tag
  # :call-seq: must_have_tag(*opts)

  ##
  # Identical to +must_have_tag+, but asserts that a matching tag does _not_
  # exist. (See +must_have_tag+ for a full discussion of the syntax.)
  #
  #   # Expect that there is not a "div" containing a "p"
  #   wont_have_tag tag: "div", descendant: { tag: "p" }
  #
  #   # Expect that an unordered list is empty
  #   wont_have_tag tag: "ul", descendant: { tag: "li" }
  #
  #   # Expect that there is not a "p" tag with between 1 to 3 "img" tags
  #   # as immediate children
  #   wont_have_tag tag: "p",
  #              children: { count: 1..3, only: { tag: "img" } }
  #
  # See also ActionController::TestCase#refute_tag
  # See also ActionView::TestCase#refute_tag
  # See also ActionDispatch::IntegrationTest#refute_tag
  # See also ActionController::TestCase#assert_no_tag
  # See also ActionView::TestCase#assert_no_tag
  # See also ActionDispatch::IntegrationTest#assert_no_tag
  #
  # :method: wont_have_tag
  # :call-seq: wont_have_tag(*opts)

  if defined?(::ActiveJob)
    ##############################################################################
    # ActiveJob Expectations
    ##############################################################################

    ##
    # Expects that the number of enqueued jobs matches the given number.
    #
    #   def test_jobs
    #     must_enqueue_jobs 0
    #     HelloJob.perform_later('david')
    #     must_enqueue_jobs 1
    #     HelloJob.perform_later('abdelkader')
    #     must_enqueue_jobs 2
    #   end
    #
    # If a block is passed, that block should cause the specified number of
    # jobs to be enqueued.
    #
    #   def test_jobs_again
    #     must_enqueue_jobs 1 do
    #       HelloJob.perform_later('cristian')
    #     end
    #
    #     must_enqueue_jobs 2 do
    #       HelloJob.perform_later('aaron')
    #       HelloJob.perform_later('rafael')
    #     end
    #   end
    #
    # See also ActiveJob::TestCase#assert_enqueued_jobs
    #
    # :method: must_enqueue_jobs
    # :call-seq: must_enqueue_jobs(number)

    ##
    # Expects that no jobs have been enqueued.
    #
    #   def test_jobs
    #     wont_enqueue_jobs
    #     HelloJob.perform_later('jeremy')
    #     must_enqueue_jobs 1
    #   end
    #
    # If a block is passed, that block should not cause any job to be enqueued.
    #
    #   def test_jobs_again
    #     wont_enqueue_jobs do
    #       # No job should be enqueued from this block
    #     end
    #   end
    #
    # Note: This expectation is simply a shortcut for:
    #
    #   must_enqueue_jobs 0, &block
    #
    # See also ActiveJob::TestCase#assert_no_enqueued_jobs
    #
    # :method: wont_enqueue_jobs
    # :call-seq: wont_enqueue_jobs(number)

    ##
    # Expects that the number of performed jobs matches the given number.
    # If no block is passed, <tt>perform_enqueued_jobs</tt>d
    # must be called around the job call.
    #
    #   def test_jobs
    #     must_perform_jobs 0
    #
    #     perform_enqueued_jobs do
    #       HelloJob.perform_later('xavier')
    #     end
    #     must_perform_jobs 1
    #
    #     perform_enqueued_jobs do
    #       HelloJob.perform_later('yves')
    #       must_perform_jobs 2
    #     end
    #   end
    #
    # If a block is passed, that block should cause the specified number of
    # jobs to be performed.
    #
    #   def test_jobs_again
    #     must_perform_jobs 1 do
    #       HelloJob.perform_later('robin')
    #     end
    #
    #     must_perform_jobs 2 do
    #       HelloJob.perform_later('carlos')
    #       HelloJob.perform_later('sean')
    #     end
    #   end
    #
    # See also ActiveJob::TestCase#assert_performed_jobs
    #
    # :method: must_perform_jobs
    # :call-seq: must_perform_jobs(number)

    ##
    # Expects that no jobs have been performed.
    #
    #   def test_jobs
    #     wont_perform_jobs
    #
    #     perform_enqueued_jobs do
    #       HelloJob.perform_later('matthew')
    #       must_perform_jobs 1
    #     end
    #   end
    #
    # If a block is passed, that block should not cause any job to be performed.
    #
    #   def test_jobs_again
    #     wont_perform_jobs do
    #       # No job should be performed from this block
    #     end
    #   end
    #
    # Note: This assertion is simply a shortcut for:
    #
    #   must_perform_jobs 0, &block
    #
    # See also ActiveJob::TestCase#assert_no_performed_jobs
    #
    # :method: wont_perform_jobs
    # :call-seq: wont_perform_jobs(number)

    ##
    # Expects that the job passed in the block has been enqueued with the given arguments.
    #
    #   def test_must_enqueue_with
    #     must_enqueue_with(job: MyJob, args: [1,2,3], queue: 'low') do
    #       MyJob.perform_later(1,2,3)
    #     end
    #   end
    #
    # See also Minitest::Rails::Expectations#assert_enqueued_with
    #
    # :method: must_enqueue_with
    # :call-seq: must_enqueue_with(args)

    ##
    # Expects that the job passed in the block has been performed with the given arguments.
    #
    #   def test_must_perform_with
    #     must_perform_with(job: MyJob, args: [1,2,3], queue: 'high') do
    #       MyJob.perform_later(1,2,3)
    #     end
    #   end
    #
    # See also Minitest::Rails::Expectations#assert_performed_with
    #
    # :method: must_perform_with
    # :call-seq: must_perform_with(args)


    # This exists as a module to allow easy mixing into classes
    # other than ActiveJob::TestCase where you might want to do
    # job testing e.g. in an Active Record model which triggers
    # jobs in a callback.
    module ActiveJob
      extend ActiveSupport::Concern
      include ::ActiveJob::TestHelper

      included do
        alias :must_enqueue_jobs :assert_enqueued_jobs
        alias :must_perform_jobs :assert_performed_jobs
        alias :wont_enqueue_jobs :assert_no_enqueued_jobs
        alias :wont_perform_jobs :assert_no_performed_jobs
        alias :must_enqueue_with :assert_enqueued_with
        alias :must_perform_with :assert_performed_with
      end
    end
  end
end

unless ENV["MT_NO_EXPECTATIONS"]
  class Object # :nodoc:
    include Minitest::Rails::Expectations
  end
  # Not real expectations, just aliases
  # The error messages don't get messed up this way
  class ActionController::TestCase # :nodoc:
    alias :must_respond_with :assert_response
    alias :must_redirect_to :assert_redirected_to
    alias :must_render_template :assert_template
    alias :must_have_tag :assert_tag
    alias :wont_have_tag :assert_no_tag
    alias :must_select :assert_select
    alias :must_select_email :assert_select_email
    alias :must_select_encoded :assert_select_encoded
  end
  class ActionView::TestCase # :nodoc:
    alias :must_respond_with :assert_response
    alias :must_redirect_to :assert_redirected_to
    alias :must_render_template :assert_template
    alias :must_have_tag :assert_tag
    alias :wont_have_tag :assert_no_tag
    alias :must_select :assert_select
    alias :must_select_email :assert_select_email
    alias :must_select_encoded :assert_select_encoded
  end
  class ActiveJob::TestCase # :nodoc:
    include Minitest::Rails::Expectations::ActiveJob
  end if defined?(ActiveJob)
  class ActionDispatch::IntegrationTest # :nodoc:
    alias :must_respond_with :assert_response
    alias :must_redirect_to :assert_redirected_to
    alias :must_render_template :assert_template
    alias :must_have_tag :assert_tag
    alias :wont_have_tag :assert_no_tag
    alias :must_select :assert_select
    alias :must_select_email :assert_select_email
    alias :must_select_encoded :assert_select_encoded
  end
end
