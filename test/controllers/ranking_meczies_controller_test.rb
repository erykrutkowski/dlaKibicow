require 'test_helper'

class RankingMecziesControllerTest < ActionController::TestCase
  setup do
    @ranking_meczy = ranking_meczies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ranking_meczies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ranking_meczy" do
    assert_difference('RankingMeczy.count') do
      post :create, ranking_meczy: { dataMeczu: @ranking_meczy.dataMeczu }
    end

    assert_redirected_to ranking_meczy_path(assigns(:ranking_meczy))
  end

  test "should show ranking_meczy" do
    get :show, id: @ranking_meczy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ranking_meczy
    assert_response :success
  end

  test "should update ranking_meczy" do
    patch :update, id: @ranking_meczy, ranking_meczy: { dataMeczu: @ranking_meczy.dataMeczu }
    assert_redirected_to ranking_meczy_path(assigns(:ranking_meczy))
  end

  test "should destroy ranking_meczy" do
    assert_difference('RankingMeczy.count', -1) do
      delete :destroy, id: @ranking_meczy
    end

    assert_redirected_to ranking_meczies_path
  end
end
