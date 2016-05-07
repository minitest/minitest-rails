require 'test_helper'

<% module_namespacing do -%>
class <%= controller_class_name %>ControllerTest < ActionDispatch::IntegrationTest
  <%- if mountable_engine? -%>
  include Engine.routes.url_helpers

  <%- end -%>
  def <%= singular_table_name %>
    @<%= singular_table_name %> ||= <%= fixture_name %> :one
  end

  def test_index
    get <%= index_helper %>_url
    assert_response :success
  end

  def test_create
    assert_difference('<%= class_name %>.count') do
      post <%= index_helper %>_url, params: { <%= "#{singular_table_name}: { #{attributes_hash} }" %> }
    end

    assert_response 201
  end

  def test_show
    get <%= show_helper %>
    assert_response :success
  end

  def test_update
    patch <%= show_helper %>, params: { <%= "#{singular_table_name}: { #{attributes_hash} }" %> }
    assert_response 200
  end

  def test_destroy
    assert_difference('<%= class_name %>.count', -1) do
      delete <%= show_helper %>
    end

    assert_response 204
  end
end
<% end -%>
