require "test_helper"

<% module_namespacing do -%>
describe <%= controller_class_name %>Controller do

  before do
    @<%= singular_table_name %> = <%= table_name %>(:one)
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
      post :create, <%= "#{singular_table_name}: { #{attributes_hash} }" %>
    end

    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  it "must show <%= singular_table_name %>" do
    get :show, <%= key_value :id, "@#{singular_table_name}" %>
    assert_response :success
  end

  it "must get edit" do
    get :edit, <%= key_value :id, "@#{singular_table_name}" %>
    assert_response :success
  end

  it "must update <%= singular_table_name %>" do
    put :update, <%= key_value :id, "@#{singular_table_name}" %>, <%= "#{singular_table_name}: { #{attributes_hash} }" %>
    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  it "must destroy <%= singular_table_name %>" do
    assert_difference('<%= class_name %>.count', -1) do
      delete :destroy, <%= key_value :id, "@#{singular_table_name}" %>
    end

    assert_redirected_to <%= index_helper %>_path
  end

end
<% end -%>
