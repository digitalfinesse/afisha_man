require 'test_helper'

class StandsControllerTest < ActionController::TestCase
  setup do
    @stand = stands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stand" do
    assert_difference('Stand.count') do
      post :create, stand: { adress: @stand.adress, description: @stand.description, latitude: @stand.latitude, longtitude: @stand.longtitude }
    end

    assert_redirected_to stand_path(assigns(:stand))
  end

  test "should show stand" do
    get :show, id: @stand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stand
    assert_response :success
  end

  test "should update stand" do
    patch :update, id: @stand, stand: { adress: @stand.adress, description: @stand.description, latitude: @stand.latitude, longtitude: @stand.longtitude }
    assert_redirected_to stand_path(assigns(:stand))
  end

  test "should destroy stand" do
    assert_difference('Stand.count', -1) do
      delete :destroy, id: @stand
    end

    assert_redirected_to stands_path
  end
end
