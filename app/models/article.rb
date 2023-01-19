class Article < ApplicationRecord
  validates :text, presence: true
  belongs_to :person
end
