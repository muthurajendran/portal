require 'test_helper'

class AdminUserSessionsControllerTest < ActionController::TestCase
  setup do
    @admin_user_session = admin_user_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_user_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_user_session" do
    assert_difference('AdminUserSession.count') do
      post :create, :admin_user_session => @admin_user_session.attributes
    end

    assert_redirected_to admin_user_session_path(assigns(:admin_user_session))
  end

  test "should show admin_user_session" do
    get :show, :id => @admin_user_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_user_session.to_param
    assert_response :success
  end

  test "should update admin_user_session" do
    put :update, :id => @admin_user_session.to_param, :admin_user_session => @admin_user_session.attributes
    assert_redirected_to admin_user_session_path(assigns(:admin_user_session))
  end

  test "should destroy admin_user_session" do
    assert_difference('AdminUserSession.count', -1) do
      delete :destroy, :id => @admin_user_session.to_param
    end

    assert_redirected_to admin_user_sessions_path
  end
end
