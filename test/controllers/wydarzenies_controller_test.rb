require 'test_helper'

class WydarzeniesControllerTest < ActionController::TestCase
  setup do
    @wydarzeny = wydarzenies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wydarzenies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wydarzeny" do
    assert_difference('Wydarzenie.count') do
      post :create, wydarzeny: { czerwona_kartka: @wydarzeny.czerwona_kartka, data_meczu: @wydarzeny.data_meczu, mecz_id: @wydarzeny.mecz_id, pilkarz_id: @wydarzeny.pilkarz_id, w_ktorej_minucie_gol: @wydarzeny.w_ktorej_minucie_gol, zawodnik_nazwisko: @wydarzeny.zawodnik_nazwisko, zolta_kartka_string: @wydarzeny.zolta_kartka_string }
    end

    assert_redirected_to wydarzeny_path(assigns(:wydarzeny))
  end

  test "should show wydarzeny" do
    get :show, id: @wydarzeny
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wydarzeny
    assert_response :success
  end

  test "should update wydarzeny" do
    patch :update, id: @wydarzeny, wydarzeny: { czerwona_kartka: @wydarzeny.czerwona_kartka, data_meczu: @wydarzeny.data_meczu, mecz_id: @wydarzeny.mecz_id, pilkarz_id: @wydarzeny.pilkarz_id, w_ktorej_minucie_gol: @wydarzeny.w_ktorej_minucie_gol, zawodnik_nazwisko: @wydarzeny.zawodnik_nazwisko, zolta_kartka_string: @wydarzeny.zolta_kartka_string }
    assert_redirected_to wydarzeny_path(assigns(:wydarzeny))
  end

  test "should destroy wydarzeny" do
    assert_difference('Wydarzenie.count', -1) do
      delete :destroy, id: @wydarzeny
    end

    assert_redirected_to wydarzenies_path
  end
end
