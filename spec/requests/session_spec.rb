require "rails_helper"

RSpec.describe 'Session', type: :request do
  before(:each) do
    get root_path
  end
  describe 'GET /' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'render template sessions/new' do
      expect(response).to render_template('sessions/new')
    end
  end
end