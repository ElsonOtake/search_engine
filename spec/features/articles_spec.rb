require 'rails_helper'

RSpec.describe 'Articles', type: :feature do
  describe 'has the following contents' do

    it 'presents title Articles' do
      visit person_articles_path(1)
      expect(page).to have_content('Articles')
    end

    it 'presents the number of articles' do
      visit person_articles_path(1)
      expect(page).to have_content('articles found')
    end
    
    it 'has a button with text Reset' do
      visit person_articles_path(1)
      expect(page).to have_content('Reset')
    end
  end
end