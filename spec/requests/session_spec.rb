# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Session management', type: :feature do
  scenario 'User creates a new session' do
    visit '/sessions/new'

    click_button 'Sign In!'

    expect(page)
  end
end
