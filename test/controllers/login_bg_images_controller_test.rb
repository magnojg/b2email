require 'test_helper'

class LoginBgImagesControllerTest < ActionController::TestCase
  setup do
    @login_bg_image = login_bg_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:login_bg_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create login_bg_image" do
    assert_difference('LoginBgImage.count') do
      post :create, login_bg_image: {  }
    end

    assert_redirected_to login_bg_image_path(assigns(:login_bg_image))
  end

  test "should show login_bg_image" do
    get :show, id: @login_bg_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @login_bg_image
    assert_response :success
  end

  test "should update login_bg_image" do
    patch :update, id: @login_bg_image, login_bg_image: {  }
    assert_redirected_to login_bg_image_path(assigns(:login_bg_image))
  end

  test "should destroy login_bg_image" do
    assert_difference('LoginBgImage.count', -1) do
      delete :destroy, id: @login_bg_image
    end

    assert_redirected_to login_bg_images_path
  end
end
