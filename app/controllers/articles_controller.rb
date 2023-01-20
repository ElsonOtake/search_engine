# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end
