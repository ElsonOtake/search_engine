# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class PeopleControllerTest < ActionDispatch::IntegrationTest
      setup do
        @person = people(:one)
      end

      test 'should get index' do
        get api_v1_people_url, as: :json
        assert_response :success
      end

      test 'should create person' do
        assert_difference('Person.count') do
          post api_v1_people_url, params: { person: {} }, as: :json
        end

        assert_response :created
      end

      test 'should show person' do
        get api_v1_person_url(@person), as: :json
        assert_response :success
      end

      test 'should update person' do
        patch api_v1_person_url(@person), params: { person: {} }, as: :json
        assert_response :success
      end

      test 'should destroy person' do
        assert_difference('Person.count', -1) do
          delete api_v1_person_url(@person), as: :json
        end

        assert_response :no_content
      end
    end
  end
end
