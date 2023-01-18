class Article < ApplicationRecord
  validates :text, presence: true

  paginates_per 10
end
