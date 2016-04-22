require 'test_helper'

class AdBarsControllerTest < ActionController::TestCase
  setup do
    @ad_bar = ad_bars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_bar" do
    assert_difference('AdBar.count') do
      post :create, ad_bar: { campaign_id: @ad_bar.campaign_id, position: @ad_bar.position }
    end

    assert_redirected_to ad_bar_path(assigns(:ad_bar))
  end

  test "should show ad_bar" do
    get :show, id: @ad_bar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_bar
    assert_response :success
  end

  test "should update ad_bar" do
    patch :update, id: @ad_bar, ad_bar: { campaign_id: @ad_bar.campaign_id, position: @ad_bar.position }
    assert_redirected_to ad_bar_path(assigns(:ad_bar))
  end

  test "should destroy ad_bar" do
    assert_difference('AdBar.count', -1) do
      delete :destroy, id: @ad_bar
    end

    assert_redirected_to ad_bars_path
  end
end
