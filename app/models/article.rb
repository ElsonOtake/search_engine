# frozen_string_literal: true

class Article < ApplicationRecord
  validates :text, presence: true
end
