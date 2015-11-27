require 'test_helper'

class PrzebiegMeczusControllerTest < ActionController::TestCase
  setup do
    @przebieg_meczu = przebieg_meczus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:przebieg_meczus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create przebieg_meczu" do
    assert_difference('PrzebiegMeczu.count') do
      post :create, przebieg_meczu: { data_meczu: @przebieg_meczu.data_meczu, druzyna: @przebieg_meczu.druzyna, miejsce_meczu: @przebieg_meczu.miejsce_meczu, rankingMeczy_id: @przebieg_meczu.rankingMeczy_id, w_ktorej_minucie_gol: @przebieg_meczu.w_ktorej_minucie_gol, wynik_meczu: @przebieg_meczu.wynik_meczu }
    end

    assert_redirected_to przebieg_meczu_path(assigns(:przebieg_meczu))
  end

  test "should show przebieg_meczu" do
    get :show, id: @przebieg_meczu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @przebieg_meczu
    assert_response :success
  end

  test "should update przebieg_meczu" do
    patch :update, id: @przebieg_meczu, przebieg_meczu: { data_meczu: @przebieg_meczu.data_meczu, druzyna: @przebieg_meczu.druzyna, miejsce_meczu: @przebieg_meczu.miejsce_meczu, rankingMeczy_id: @przebieg_meczu.rankingMeczy_id, w_ktorej_minucie_gol: @przebieg_meczu.w_ktorej_minucie_gol, wynik_meczu: @przebieg_meczu.wynik_meczu }
    assert_redirected_to przebieg_meczu_path(assigns(:przebieg_meczu))
  end

  test "should destroy przebieg_meczu" do
    assert_difference('PrzebiegMeczu.count', -1) do
      delete :destroy, id: @przebieg_meczu
    end

    assert_redirected_to przebieg_meczus_path
  end
end
