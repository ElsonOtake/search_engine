# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Analytic, type: :model do
  before(:each) do
    @person = Person.create(name: 'Analytic Jones')
    @analytic = Analytic.new(keyword: 'Open Source', results: 12, person_id: @person.id)
  end

  context 'New analytic' do
    it 'is valid with valid attributes' do
      expect(@analytic).to be_valid
    end

    it 'is not valid without a keyword' do
      @analytic.keyword = nil
      expect(@analytic).to_not be_valid
    end

    it 'is not valid with non positive number on results' do
      @analytic.results = -5
      expect(@analytic).to_not be_valid
    end

    it 'is not valid with non numeric data on results' do
      @analytic.results = "five"
      expect(@analytic).to_not be_valid
    end

    it 'is not valid without person_id' do
      @analytic.person_id = nil
      expect(@analytic).to_not be_valid
    end
  end
end
