require "test_helper"

<% module_namespacing do -%>
class <%= controller_class_name %>ControllerTest < ActionController::TestCase
  def <%= singular_table_name %>
    @<%= singular_table_name %> ||= <%= table_name %> :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:<%= table_name %>)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("<%= class_name %>.count") do
      post :create, <%= "#{singular_table_name}: { #{attributes_hash} }" %>
    end

    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  def test_show
    get :show, id: <%= singular_table_name %>
    assert_response :success
  end

  def test_edit
    get :edit, id: <%= singular_table_name %>
    assert_response :success
  end

  def test_update
    put :update, id: <%= singular_table_name %>, <%= "#{singular_table_name}: { #{attributes_hash} }" %>
    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  def test_destroy
    assert_difference("<%= class_name %>.count", -1) do
      delete :destroy, id: <%= singular_table_name %>
    end

    assert_redirected_to <%= index_helper %>_path
  end
end
<% end -%>
