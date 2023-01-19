class Person < ApplicationRecord
  has_many :analytics
  validates :name, presence: true, uniqueness: true
end
