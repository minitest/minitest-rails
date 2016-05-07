require 'test_helper'

<% module_namespacing do -%>
class <%= controller_class_name %>ControllerTest < ActionDispatch::IntegrationTest
  <%- if mountable_engine? -%>
  include Engine.routes.url_helpers

  <%- end -%>
  let(:<%= singular_table_name %>) { <%= fixture_name %> :one }

  it "gets index" do
    get <%= index_helper %>_url
    value(response).must_be :success?
  end

  it "creates <%= singular_table_name %>" do
    expect {
      post <%= index_helper %>_url, params: { <%= "#{singular_table_name}: { #{attributes_hash} }" %> }
    }.must_change "<%= class_name %>.count"

    value(response.status).must_equal 201
  end

  it "shows <%= singular_table_name %>" do
    get <%= show_helper %>
    value(response).must_be :success?
  end

  it "updates <%= singular_table_name %>" do
    patch <%= show_helper %>, params: { <%= "#{singular_table_name}: { #{attributes_hash} }" %> }
    value(response.status).must_equal 200
  end

  it "destroys <%= singular_table_name %>" do
    expect {
      delete <%= show_helper %>
    }.must_change "<%= class_name %>.count", -1

    value(response.status).must_equal 204
  end
end
<% end -%>
