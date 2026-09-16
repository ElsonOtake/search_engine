# frozen_string_literal: true

require 'swagger_helper'

describe 'People' do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @person = Person.create(name: 'test_user')
  end

  path '/api/v1/people' do
    get 'List people' do
      tags 'People'
      description 'List all people'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array, items: {
          type: :object, properties: { id: { type: :integer },
                                       name: { type: :string },
                                       created_at: { type: :string },
                                       updated_at: { type: :string } }
        }
        run_test!
      end
    end
  end

  path '/api/v1/people' do
    post 'Create a person' do
      tags 'People'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :person,
                in: :body,
                description: 'Create a person',
                schema: {
                  type: :object,
                  properties: { name: { type: :string } },
                  required: %w[name]
                }

      response '201', 'OK' do
        schema type: :object,
               properties: { id: { type: :integer }, name: { type: :string }, created_at: { type: :string },
                             updated_at: { type: :string } }

        let(:person) { { name: 'Person Name' } }
        run_test!
      end

      response '422', 'Unprocessable entity' do
        let(:person) { {} }
        run_test!
      end
    end
  end

  path '/api/v1/people/{id}' do
    get 'Show a person' do
      tags 'People'
      description 'Show a person'
      produces 'application/json'

      parameter name: :id,
                in: :path,
                type: :integer,
                required: true,
                description: 'Person identification'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               }

        let(:id) { @person.id }
        run_test!
      end

      response '404', 'Not Found' do
        let(:id) { 999_999 }
        run_test!
      end
    end
  end

  path '/api/v1/people/{id}' do # rubocop:disable Metrics/BlockLength
    put 'Updates a person' do
      tags 'People'
      description 'Updates a person'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :integer, required: true, description: 'Person identification'

      parameter name: :person, in: :body, description: 'Updates a person',
                schema: { type: :object, roperties: { name: { type: :string } } }

      response '200', 'OK' do
        schema type: :object, properties: { id: { type: :integer }, name: { type: :string },
                                            created_at: { type: :string }, updated_at: { type: :string } }

        let(:id) { @person.id }
        let(:person) { { name: 'another_name' } }
        run_test!
      end

      response '404', 'Not Found' do
        let(:id) { 999_999 }
        let(:person) { { name: 'another_name' } }
        run_test!
      end

      response '422', 'Unprocessable entity' do
        let(:id) { @person.id }
        let(:person) { { name: '' } }
        run_test!
      end
    end
  end

  path '/api/v1/people/{id}' do
    delete 'Delete a person' do
      tags 'People'
      description 'Delete a person'
      produces 'application/json'

      parameter name: :id,
                in: :path,
                type: :integer,
                required: true,
                description: 'Person identification'

      response '204', 'OK' do
        let(:id) { Person.create(name: 'test delete').id }
        run_test!
      end

      response '404', 'Not Found' do
        let(:id) { 999_999 }
        run_test!
      end
    end
  end
end
