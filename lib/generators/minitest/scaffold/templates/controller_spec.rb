require "test_helper"

<% module_namespacing do -%>
describe <%= controller_class_name %>Controller do

  let(:<%= singular_table_name %>) { <%= table_name %> :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:<%= table_name %>)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates <%= singular_table_name %>" do
    assert_difference('<%= class_name %>.count') do
      post :create, <%= "#{singular_table_name}: { #{attributes_hash} }" %>
    end

    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  it "shows <%= singular_table_name %>" do
    get :show, id: <%= singular_table_name %>
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: <%= singular_table_name %>
    assert_response :success
  end

  it "updates <%= singular_table_name %>" do
    put :update, id: <%= singular_table_name %>, <%= "#{singular_table_name}: { #{attributes_hash} }" %>
    assert_redirected_to <%= singular_table_name %>_path(assigns(:<%= singular_table_name %>))
  end

  it "destroys <%= singular_table_name %>" do
    assert_difference('<%= class_name %>.count', -1) do
      delete :destroy, id: <%= singular_table_name %>
    end

    assert_redirected_to <%= index_helper %>_path
  end

end
<% end -%>
