require 'rails_helper'

RSpec.describe Analytic, type: :request do
  before(:each) do
    @person = Person.create(name: 'analytic')
    @analytic = Analytic.create(keyword: 'open source', results: 12, person_id: @person.id)
  end

  describe 'GET api/v1/people/:person_id/analytics' do
    before(:each) do
      get "/api/v1/people/#{@person.id}/analytics"
    end

    it 'return a success status' do
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end

    it 'return json file with analytic data' do
      json = JSON.parse(response.body)[0].with_indifferent_access
      expect(json['id']).to be_an(Integer)
      expect(json.keys).to match_array(%w[id keyword results person_id created_at updated_at])
    end
  end

  describe 'GET api/v1/people/:person_id/analytics/:id' do
    before(:each) do
      get "/api/v1/people/#{@person.id}/analytics/#{@analytic.id}"
    end
    it 'return a success status' do
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end

    it 'return json file with analytic data' do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json['id']).to eq(@analytic.id)
      expect(json['keyword']).to eq('open source')
      expect(json['results']).to eq(12)
      expect(json['person_id']).to eq(@person.id)
      expect(json.keys).to match_array(%w[id keyword results person_id created_at updated_at])
    end
  end

  describe 'POST api/v1/people/:person_id/analytics' do
    before(:each) do
      post "/api/v1/people/#{@person.id}/analytics", params: {
        keyword: 'new keyword',
        results: 100,
        user_id: @person.id
      }.to_json
    end

    it 'return a success status' do
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:success)
    end

    it 'return json file with analytic data' do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json['id']).to be_an(Integer)
      expect(json['keyword']).to eq('new keyword')
      expect(json['results']).to eq(100)
      expect(json['person_id']).to eq(@person.id)
      expect(json.keys).to match_array(%w[id keyword results person_id created_at updated_at])
    end
  end

  describe 'PUT api/v1/people/:person_id/analytics/:id' do
    before(:each) do
      put "/api/v1/people/#{@person.id}/analytics/#{@analytic.id}", params: {
        keyword: 'new keyword with a lot of words',
        results: 0
      }.to_json
    end
    it 'return success status' do
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end

    it 'return json file with analytic data' do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json['id']).to be_an(Integer)
      expect(json['keyword']).to eq('new keyword with a lot of words')
      expect(json['results']).to eq(0)
      expect(json['person_id']).to eq(@person.id)
      expect(json.keys).to match_array(%w[id keyword results person_id created_at updated_at])
    end
  end

  describe 'DELETE api/v1/people/:person_id/analytics/:id' do

    it 'return success status' do
      delete "/api/v1/people/#{@person.id}/analytics/#{@analytic.id}"
      expect(response.status).to eq(204)
      expect(response).to have_http_status(:success)
    end
  end
end
