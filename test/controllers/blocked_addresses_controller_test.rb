# == Schema Information
#
# Table name: blocked_addresses
#
#  id         :integer          not null, primary key
#  ip_address :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BlockedAddressesControllerTest < ActionController::TestCase
  setup do
    @blocked_address = blocked_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blocked_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blocked_address" do
    assert_difference('BlockedAddress.count') do
      post :create, blocked_address: { ip_address: @blocked_address.ip_address }
    end

    assert_redirected_to blocked_address_path(assigns(:blocked_address))
  end

  test "should show blocked_address" do
    get :show, id: @blocked_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blocked_address
    assert_response :success
  end

  test "should update blocked_address" do
    patch :update, id: @blocked_address, blocked_address: { ip_address: @blocked_address.ip_address }
    assert_redirected_to blocked_address_path(assigns(:blocked_address))
  end

  test "should destroy blocked_address" do
    assert_difference('BlockedAddress.count', -1) do
      delete :destroy, id: @blocked_address
    end

    assert_redirected_to blocked_addresses_path
  end
end
