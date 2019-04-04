# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User tries to create new shortened url' do
  before do
    visit root_path
  end

  scenario 'and sees form with proper field and button' do
    expect(page).to have_field 'shortened_url[original_url]'
    expect(page).to have_button 'SHORTEN'
  end

  context 'with success' do
    let(:shortened_url) { ShortenedUrl.last }

    it 'sees info about shortened url' do
      fill_in 'shortened_url[original_url]', with: 'google.pl'
      click_button 'SHORTEN'

      expect(page).to have_content 'Original url'
      expect(find('#original_url').value).to eq 'google.pl'
      expect(page).to have_content 'Shortened url'
      expect(find('#shortened_url').value).to eq "http://www.example.com/#{shortened_url.key}"
    end
  end
end
