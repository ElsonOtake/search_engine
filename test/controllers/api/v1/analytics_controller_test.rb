require "test_helper"

class Api::V1::AnalyticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analytic = analytics(:one)
  end

  test "should get index" do
    get api_v1_analytics_url, as: :json
    assert_response :success
  end

  test "should create analytic" do
    assert_difference("Analytic.count") do
      post api_v1_analytics_url, params: { analytic: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show analytic" do
    get api_v1_analytic_url(@analytic), as: :json
    assert_response :success
  end

  test "should update analytic" do
    patch api_v1_analytic_url(@analytic), params: { analytic: {  } }, as: :json
    assert_response :success
  end

  test "should destroy analytic" do
    assert_difference("Analytic.count", -1) do
      delete api_v1_analytic_url(@analytic), as: :json
    end

    assert_response :no_content
  end
end
