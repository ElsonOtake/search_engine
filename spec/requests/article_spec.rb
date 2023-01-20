require 'rails_helper'

RSpec.describe 'Article', type: :request do

  describe 'GET /people/1/articles' do
    before(:each) do
      get person_articles_path(1)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'render template articles/index' do
      expect(response).to render_template('articles/index')
    end
    it 'not render template articles/show' do
      expect(response).to_not render_template('articles/show')
    end
  end
end
