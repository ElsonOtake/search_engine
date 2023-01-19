class Article < ApplicationRecord
  validates :text, presence: true
end
