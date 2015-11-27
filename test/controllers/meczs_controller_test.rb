require 'test_helper'

class MeczsControllerTest < ActionController::TestCase
  setup do
    @mecz = meczs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meczs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mecz" do
    assert_difference('Mecz.count') do
      post :create, mecz: { druzyna_id: @mecz.druzyna_id, gosc: @mecz.gosc, gospodarz: @mecz.gospodarz, punkty_gosci: @mecz.punkty_gosci, punkty_gospodarzy: @mecz.punkty_gospodarzy }
    end

    assert_redirected_to mecz_path(assigns(:mecz))
  end

  test "should show mecz" do
    get :show, id: @mecz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mecz
    assert_response :success
  end

  test "should update mecz" do
    patch :update, id: @mecz, mecz: { druzyna_id: @mecz.druzyna_id, gosc: @mecz.gosc, gospodarz: @mecz.gospodarz, punkty_gosci: @mecz.punkty_gosci, punkty_gospodarzy: @mecz.punkty_gospodarzy }
    assert_redirected_to mecz_path(assigns(:mecz))
  end

  test "should destroy mecz" do
    assert_difference('Mecz.count', -1) do
      delete :destroy, id: @mecz
    end

    assert_redirected_to meczs_path
  end
end
