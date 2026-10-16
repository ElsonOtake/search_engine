require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:each) do
    @article = Article.new(text: "Article's text")
  end

  context 'New article' do
    it 'is valid with valid attributes' do
      expect(@article).to be_valid
    end

    it 'is not valid without a text' do
      @article.text = nil
      expect(@article).to_not be_valid
    end

    it 'is not valid with blank text' do
      @article.text = ' '
      expect(@article).to_not be_valid
    end
  end
end
