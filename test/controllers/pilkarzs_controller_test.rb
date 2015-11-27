require 'test_helper'

class PilkarzsControllerTest < ActionController::TestCase
  setup do
    @pilkarz = pilkarzs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pilkarzs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pilkarz" do
    assert_difference('Pilkarz.count') do
      post :create, pilkarz: { druzyna_id: @pilkarz.druzyna_id, ileGoli: @pilkarz.ileGoli, ile_czerwonych: @pilkarz.ile_czerwonych, ile_zoltych_kartek: @pilkarz.ile_zoltych_kartek, imie: @pilkarz.imie, nazwisko: @pilkarz.nazwisko }
    end

    assert_redirected_to pilkarz_path(assigns(:pilkarz))
  end

  test "should show pilkarz" do
    get :show, id: @pilkarz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pilkarz
    assert_response :success
  end

  test "should update pilkarz" do
    patch :update, id: @pilkarz, pilkarz: { druzyna_id: @pilkarz.druzyna_id, ileGoli: @pilkarz.ileGoli, ile_czerwonych: @pilkarz.ile_czerwonych, ile_zoltych_kartek: @pilkarz.ile_zoltych_kartek, imie: @pilkarz.imie, nazwisko: @pilkarz.nazwisko }
    assert_redirected_to pilkarz_path(assigns(:pilkarz))
  end

  test "should destroy pilkarz" do
    assert_difference('Pilkarz.count', -1) do
      delete :destroy, id: @pilkarz
    end

    assert_redirected_to pilkarzs_path
  end
end
