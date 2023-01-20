require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do
  describe 'without FactoryBot login' do
    it 'will present splash page' do
      visit '/'
      expect(current_path).to eq(root_path)
      expect(current_path).to eq('/')
    end

    it 'will have page content' do
      visit root_path
      expect(page).to have_content('Please Sign in')
    end
  end
end