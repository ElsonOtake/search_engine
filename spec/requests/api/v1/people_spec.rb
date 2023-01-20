require 'rails_helper'

RSpec.describe Person, type: :request do
  before(:each) do
    @person = Person.create(name: 'person')
  end

  describe 'GET api/v1/people' do
    before(:each) do
      get '/api/v1/people'
    end

    it 'return a success status' do
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end

    it 'return json file with person data' do
      json = JSON.parse(response.body)[0].with_indifferent_access
      expect(json['id']).to be_an(Integer)
      expect(json.keys).to match_array(%w[id name created_at updated_at])
    end
  end

  describe 'GET api/v1/people/:id' do
    before(:each) do
      get "/api/v1/people/#{@person.id}"
    end
    it 'return a success status' do
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end

    it 'return json file with person data' do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json['id']).to eq(@person.id)
      expect(json['name']).to eq('person')
      expect(json.keys).to match_array(%w[id name created_at updated_at])
    end

    it 'invalid without a valid person' do
      get '/api/v1/people/0'
      expect(response.status).to eq(404)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST api/v1/people' do
    before(:each) do
      post '/api/v1/people', params: {
        name: 'new_personname'
      }.to_json
    end

    it 'return a success status' do
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:success)
    end

    it 'return json file with person data' do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json['id']).to be_an(Integer)
      expect(json['name']).to eq('new_personname')
      expect(json.keys).to match_array(%w[id name created_at updated_at])
    end
  end

  describe 'PUT api/v1/people/:id' do
    before(:each) do
      put "/api/v1/people/#{@person.id}", params: {
        name: 'rename_personname',
        password: 'rename_password',
        email: 'rename_personname@email.com',
        role: 'admin'
      }.to_json
    end
    it 'return success status' do
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end

    it 'return json file with person data' do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json['id']).to be_an(Integer)
      expect(json['name']).to eq('rename_personname')
      expect(json.keys).to match_array(%w[id name created_at updated_at])
    end
  end

  describe 'DELETE api/v1/people/:id' do

    it 'return success status' do
      delete "/api/v1/people/#{@person.id}"
      expect(response.status).to eq(204)
      expect(response).to have_http_status(:success)
    end

    it 'invalid without valid person' do
      delete '/api/v1/people/0'
      expect(response.status).to eq(404)
      expect(response).to have_http_status(:not_found)
    end
  end
end
