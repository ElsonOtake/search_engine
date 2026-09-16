# frozen_string_literal: true

require 'swagger_helper'

describe 'Analytics' do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @person = Person.create(name: 'test_user')
    @analytic = @person.analytics.create(keyword: 'palavra', results: 10)
  end

  path '/api/v1/people/{person_id}/analytics' do
    get 'List analytics' do
      tags 'Analytics'
      description 'List all analytics'
      produces 'application/json'

      parameter name: :person_id,
                in: :path,
                type: :integer,
                required: true,
                description: 'Person identification'

      response '200', 'OK' do
        schema type: :array, items: { type: :object,
                                      properties: {
                                        id: { type: :integer },
                                        keyword: { type: :string },
                                        results: { type: :integer },
                                        created_at: { type: :string },
                                        updated_at: { type: :string }
                                      } }

        let(:person_id) { @person.id }
        run_test!
      end
    end
  end

  path '/api/v1/people/{person_id}/analytics' do
    post 'Create a analytic' do
      tags 'Analytics'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :person_id, in: :path, type: :integer, required: true, description: 'Person identification'

      parameter name: :analytic, in: :body, description: 'Create a analytic',
                schema: { type: :object, properties: { keyword: { type: :string }, results: { type: :integer } },
                          required: %w[keyword] }

      response '201', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer }, keyword: { type: :string }, results: { type: :integer },
                 person_id: { type: :integer }, created_at: { type: :string }, updated_at: { type: :string } }

        let(:person_id) { @person.id }
        let(:analytic) { { keyword: 'Palavra Chave', results: 10 } }
        run_test!
      end

      response '422', 'Unprocessable entity' do
        let(:person_id) { @person.id }
        let(:analytic) { { keyword: '', results: '10' } }
        run_test!
      end
    end
  end

  path '/api/v1/people/{person_id}/analytics/{id}' do
    get 'Show a analytic' do
      tags 'Analytics'
      description 'Show a analytic'
      produces 'application/json'

      parameter name: :person_id, in: :path, type: :integer, required: true, description: 'Person identification'

      parameter name: :id, in: :path, type: :integer, required: true, description: 'Analytic identification'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer }, keyword: { type: :string }, results: { type: :integer },
                 person_id: { type: :integer }, created_at: { type: :string }, updated_at: { type: :string }
               }
        let(:person_id) { @person.id }
        let(:id) { @analytic.id }
        run_test!
      end

      response '404', 'Not Found' do
        let(:person_id) { @person.id }
        let(:id) { 999_999 }
        run_test!
      end
    end
  end

  path '/api/v1/people/{person_id}/analytics/{id}' do # rubocop:disable Metrics/BlockLength
    put 'Updates a analytic' do # rubocop:disable Metrics/BlockLength
      tags 'Analytics'
      description 'Updates a analytic'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :person_id, in: :path, type: :integer, required: true, description: 'Person identification'

      parameter name: :id, in: :path, type: :integer, required: true, description: 'Analytic identification'

      parameter name: :analytic, in: :body, description: 'Updates a analytic',
                schema: {
                  type: :object, properties: { keyword: { type: :string }, results: { type: :integer } }
                }
      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer }, keyword: { type: :string }, results: { type: :integer },
                 person_id: { type: :integer }, created_at: { type: :string }, updated_at: { type: :string }
               }
        let(:person_id) { @person.id }
        let(:id) { @analytic.id }
        let(:analytic) { { keyword: 'chave', results: 5 } }
        run_test!
      end

      response '404', 'Not Found' do
        let(:person_id) { @person.id }
        let(:id) { 999_999 }
        let(:analytic) { { keyword: 'chave', results: 5 } }
        run_test!
      end

      response '422', 'Unprocessable entity' do
        let(:person_id) { @person.id }
        let(:id) { @analytic.id }
        let(:analytic) { { keyword: '', results: '5' } }
        run_test!
      end
    end
  end

  path '/api/v1/people/{person_id}/analytics/{id}' do
    delete 'Delete a analytic' do
      tags 'Analytics'
      description 'Delete a analytic'
      produces 'application/json'

      parameter name: :person_id,
                in: :path,
                type: :integer,
                required: true,
                description: 'Person identification'

      parameter name: :id,
                in: :path,
                type: :integer,
                required: true,
                description: 'Analytic identification'

      response '204', 'OK' do
        let(:person_id) { @person.id }
        let(:id) { @analytic.id }
        run_test!
      end

      response '404', 'Not Found' do
        let(:person_id) { 999_999 }
        let(:id) { @analytic.id }
        run_test!
      end
    end
  end
end
