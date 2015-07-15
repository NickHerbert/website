require 'test_helper'

class Admin::MapsControllerTest < ActionController::TestCase
  setup do
    @admin_map = admin_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_map" do
    assert_difference('Admin::Map.count') do
      post :create, admin_map: { description: @admin_map.description, download: @admin_map.download, logo: @admin_map.logo }
    end

    assert_redirected_to admin_map_path(assigns(:admin_map))
  end

  test "should show admin_map" do
    get :show, id: @admin_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_map
    assert_response :success
  end

  test "should update admin_map" do
    put :update, id: @admin_map, admin_map: { description: @admin_map.description, download: @admin_map.download, logo: @admin_map.logo }
    assert_redirected_to admin_map_path(assigns(:admin_map))
  end

  test "should destroy admin_map" do
    assert_difference('Admin::Map.count', -1) do
      delete :destroy, id: @admin_map
    end

    assert_redirected_to admin_maps_path
  end
end
