require "spec_helper"

<% module_namespacing do -%>
describe <%= controller_class_name %>Controller do

  before do
    @<%= singular_table_name %> = <%= class_name %>.new
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:<%= table_name %>)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create <%= singular_table_name %>" do
    assert_difference('<%= class_name %>.count') do
      post :create, <%= key_value singular_table_name, "@#{singular_table_name}.attributes" %>
    end

    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  it "must show <%= singular_table_name %>" do
    get :show, <%= key_value :id, "@#{singular_table_name}.to_param" %>
    assert_response :success
  end

  it "must get edit" do
    get :edit, <%= key_value :id, "@#{singular_table_name}.to_param" %>
    assert_response :success
  end

  it "must update <%= singular_table_name %>" do
    put :update, <%= key_value :id, "@#{singular_table_name}.to_param" %>, <%= key_value singular_table_name, "@#{singular_table_name}.attributes" %>
    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  it "must destroy <%= singular_table_name %>" do
    assert_difference('<%= class_name %>.count', -1) do
      delete :destroy, <%= key_value :id, "@#{singular_table_name}.to_param" %>
    end

    assert_redirected_to <%= index_helper %>_path
  end

end
<% end -%>
