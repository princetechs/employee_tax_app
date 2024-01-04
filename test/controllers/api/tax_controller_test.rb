require "test_helper"

class Api::TaxControllerTest < ActionDispatch::IntegrationTest
  test "should get tax_deduction" do
    get api_tax_tax_deduction_url
    assert_response :success
  end
end
