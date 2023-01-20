# frozen_string_literal: true

class Analytic < ApplicationRecord
  belongs_to :person
  validates :keyword, presence: true
  validates :results, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
