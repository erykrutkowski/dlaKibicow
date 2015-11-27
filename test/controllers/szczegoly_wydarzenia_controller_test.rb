require 'test_helper'

class SzczegolyWydarzeniaControllerTest < ActionController::TestCase
  setup do
    @szczegoly_wydarzenium = szczegoly_wydarzenia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:szczegoly_wydarzenia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create szczegoly_wydarzenium" do
    assert_difference('SzczegolyWydarzenium.count') do
      post :create, szczegoly_wydarzenium: { czerwone_kartki: @szczegoly_wydarzenium.czerwone_kartki, data_wydarzenia: @szczegoly_wydarzenium.data_wydarzenia, ile_goli: @szczegoly_wydarzenium.ile_goli, mecz_id: @szczegoly_wydarzenium.mecz_id, pilkarz_id: @szczegoly_wydarzenium.pilkarz_id, zolte_kartki: @szczegoly_wydarzenium.zolte_kartki }
    end

    assert_redirected_to szczegoly_wydarzenium_path(assigns(:szczegoly_wydarzenium))
  end

  test "should show szczegoly_wydarzenium" do
    get :show, id: @szczegoly_wydarzenium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @szczegoly_wydarzenium
    assert_response :success
  end

  test "should update szczegoly_wydarzenium" do
    patch :update, id: @szczegoly_wydarzenium, szczegoly_wydarzenium: { czerwone_kartki: @szczegoly_wydarzenium.czerwone_kartki, data_wydarzenia: @szczegoly_wydarzenium.data_wydarzenia, ile_goli: @szczegoly_wydarzenium.ile_goli, mecz_id: @szczegoly_wydarzenium.mecz_id, pilkarz_id: @szczegoly_wydarzenium.pilkarz_id, zolte_kartki: @szczegoly_wydarzenium.zolte_kartki }
    assert_redirected_to szczegoly_wydarzenium_path(assigns(:szczegoly_wydarzenium))
  end

  test "should destroy szczegoly_wydarzenium" do
    assert_difference('SzczegolyWydarzenium.count', -1) do
      delete :destroy, id: @szczegoly_wydarzenium
    end

    assert_redirected_to szczegoly_wydarzenia_path
  end
end
