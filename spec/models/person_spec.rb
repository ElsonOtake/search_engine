# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  before(:each) do
    @person = Person.new(name: 'Search')
  end

  context 'New person' do
    it 'is valid with valid attributes' do
      expect(@person).to be_valid
    end

    it 'is not valid without a name' do
      @person.name = nil
      expect(@person).to_not be_valid
    end

    it 'is not valid with blank name' do
      @person.name = ' '
      expect(@person).to_not be_valid
    end
  end
end
