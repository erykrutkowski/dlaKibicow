require 'test_helper'

class DruzynasControllerTest < ActionController::TestCase
  setup do
    @druzyna = druzynas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:druzynas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create druzyna" do
    assert_difference('Druzyna.count') do
      post :create, druzyna: { miasto_pochodzenia: @druzyna.miasto_pochodzenia, nazwa: @druzyna.nazwa, nazwisko_trenera: @druzyna.nazwisko_trenera }
    end

    assert_redirected_to druzyna_path(assigns(:druzyna))
  end

  test "should show druzyna" do
    get :show, id: @druzyna
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @druzyna
    assert_response :success
  end

  test "should update druzyna" do
    patch :update, id: @druzyna, druzyna: { miasto_pochodzenia: @druzyna.miasto_pochodzenia, nazwa: @druzyna.nazwa, nazwisko_trenera: @druzyna.nazwisko_trenera }
    assert_redirected_to druzyna_path(assigns(:druzyna))
  end

  test "should destroy druzyna" do
    assert_difference('Druzyna.count', -1) do
      delete :destroy, id: @druzyna
    end

    assert_redirected_to druzynas_path
  end
end
