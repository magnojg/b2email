require 'test_helper'

class Admin::AdBarsControllerTest < ActionController::TestCase
  setup do
    @admin_ad_bar = admin_ad_bars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_ad_bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_ad_bar" do
    assert_difference('Admin::AdBar.count') do
      post :create, admin_ad_bar: { admin_campaign_id: @admin_ad_bar.admin_campaign_id, position: @admin_ad_bar.position }
    end

    assert_redirected_to admin_ad_bar_path(assigns(:admin_ad_bar))
  end

  test "should show admin_ad_bar" do
    get :show, id: @admin_ad_bar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_ad_bar
    assert_response :success
  end

  test "should update admin_ad_bar" do
    patch :update, id: @admin_ad_bar, admin_ad_bar: { admin_campaign_id: @admin_ad_bar.admin_campaign_id, position: @admin_ad_bar.position }
    assert_redirected_to admin_ad_bar_path(assigns(:admin_ad_bar))
  end

  test "should destroy admin_ad_bar" do
    assert_difference('Admin::AdBar.count', -1) do
      delete :destroy, id: @admin_ad_bar
    end

    assert_redirected_to admin_ad_bars_path
  end
end
