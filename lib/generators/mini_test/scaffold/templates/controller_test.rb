require "minitest_helper"

<% module_namespacing do -%>
class <%= class_name %>ControllerTest < MiniTest::Rails::Controller
  before do
    @<%= singular_table_name %> = <%= table_name %>(:one)
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
    assert_difference('<%= class_name %>.count') do
      post :create, <%= key_value singular_table_name, "@#{singular_table_name}.attributes" %>
    end

    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  def test_show
    get :show, <%= key_value :id, "@#{singular_table_name}.to_param" %>
    assert_response :success
  end

  def test_edit
    get :edit, <%= key_value :id, "@#{singular_table_name}.to_param" %>
    assert_response :success
  end

  def test_update
    put :update, <%= key_value :id, "@#{singular_table_name}.to_param" %>, <%= key_value singular_table_name, "@#{singular_table_name}.attributes" %>
    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  def test_destroy
    assert_difference('<%= class_name %>.count', -1) do
      delete :destroy, <%= key_value :id, "@#{singular_table_name}.to_param" %>
    end

    assert_redirected_to <%= index_helper %>_path
  end
end
<% end -%>
