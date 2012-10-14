require 'test_helper'

class AdminNewsQueuesControllerTest < ActionController::TestCase
  setup do
    @admin_news_queue = admin_news_queues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_news_queues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_news_queue" do
    assert_difference('AdminNewsQueue.count') do
      post :create, :admin_news_queue => @admin_news_queue.attributes
    end

    assert_redirected_to admin_news_queue_path(assigns(:admin_news_queue))
  end

  test "should show admin_news_queue" do
    get :show, :id => @admin_news_queue.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_news_queue.to_param
    assert_response :success
  end

  test "should update admin_news_queue" do
    put :update, :id => @admin_news_queue.to_param, :admin_news_queue => @admin_news_queue.attributes
    assert_redirected_to admin_news_queue_path(assigns(:admin_news_queue))
  end

  test "should destroy admin_news_queue" do
    assert_difference('AdminNewsQueue.count', -1) do
      delete :destroy, :id => @admin_news_queue.to_param
    end

    assert_redirected_to admin_news_queues_path
  end
end
