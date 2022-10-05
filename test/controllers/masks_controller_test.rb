require 'test_helper'

class MasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mask = masks(:one)
  end

  test "should get index" do
    get masks_url
    assert_response :success
  end

  test "should get new" do
    get new_mask_url
    assert_response :success
  end

  test "should create mask" do
    assert_difference('Mask.count') do
      post masks_url, params: { mask: { amount: @mask.amount, areaId: @mask.areaId } }
    end

    assert_redirected_to mask_url(Mask.last)
  end

  test "should show mask" do
    get mask_url(@mask)
    assert_response :success
  end

  test "should get edit" do
    get edit_mask_url(@mask)
    assert_response :success
  end

  test "should update mask" do
    patch mask_url(@mask), params: { mask: { amount: @mask.amount, areaId: @mask.areaId } }
    assert_redirected_to mask_url(@mask)
  end

  test "should destroy mask" do
    assert_difference('Mask.count', -1) do
      delete mask_url(@mask)
    end

    assert_redirected_to masks_url
  end
end
