require 'test_helper'

class Admin::PicturesControllerTest < ActionController::TestCase
  setup do
    @admin_picture = admin_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_picture" do
    assert_difference('Admin::Picture.count') do
      post :create, admin_picture: { caption: @admin_picture.caption, image: @admin_picture.image }
    end

    assert_redirected_to admin_picture_path(assigns(:admin_picture))
  end

  test "should show admin_picture" do
    get :show, id: @admin_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_picture
    assert_response :success
  end

  test "should update admin_picture" do
    put :update, id: @admin_picture, admin_picture: { caption: @admin_picture.caption, image: @admin_picture.image }
    assert_redirected_to admin_picture_path(assigns(:admin_picture))
  end

  test "should destroy admin_picture" do
    assert_difference('Admin::Picture.count', -1) do
      delete :destroy, id: @admin_picture
    end

    assert_redirected_to admin_pictures_path
  end
end
